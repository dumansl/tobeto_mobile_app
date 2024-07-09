import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class AuthService {
  FirebaseAuth get _auth => FirebaseServiceProvider().auth;
  FirebaseFirestore get _db => FirebaseServiceProvider().firestore;
  final googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  // Kullanıcı bilgilerini kaydetme
  Future<void> registerUser({
    required User user,
    required String name,
    required String lastName,
    required String email,
  }) async {
    return handleErrors(
      operation: () async {
        await _db.collection("users").doc(user.uid).set({
          'firstName': name,
          'lastName': lastName,
          'email': email,
        });
      },
      onError: (e) {
        debugPrint('Error registering user: $e');
        throw e;
      },
    );
  }

  // Kaydolma işlemi
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
  }) async {
    return handleErrors(
      operation: () async {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User? user = userCredential.user;

        if (user != null) {
          await user.updateDisplayName('$name $lastName');
          await user.sendEmailVerification();
        }

        return user;
      },
      onError: (e) {
        if (e is FirebaseAuthException) {
          if (e.code == "weak-password") {
            throw Exception("Bu şifre çok zayıf");
          } else if (e.code == "email-already-in-use") {
            throw Exception("Bu e-posta için hesap zaten mevcut");
          } else {
            throw Exception("Bir hata oluştu: ${e.message}");
          }
        }
        debugPrint("Kaydolma hatası: $e");
      },
    );
  }

  // Google ile giriş yapma işlemi
  Future<void> signInWithGoogle() async {
    return handleErrors(
      operation: () async {
        final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
          final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          UserCredential userCredential = await _auth.signInWithCredential(authCredential);
          User? user = userCredential.user;

          if (user != null) {
            var userDoc = await _db.collection("users").doc(user.uid).get();
            if (!userDoc.exists) {
              await registerUser(
                user: user,
                name: user.displayName?.split(' ').first ?? '',
                lastName: user.displayName?.split(' ').last ?? '',
                email: user.email ?? '',
              );
            }
          }
        }
      },
      onError: (e) {
        if (e is FirebaseAuthException) {
          debugPrint("Google ile giriş hatası: ${e.message}");
        }
        debugPrint("Google ile giriş hatası: $e");
      },
    );
  }

  // Misafir olarak giriş
  Future<void> signInAnonymously() async {
    return handleErrors(
      operation: () async {
        final userCredential = await _auth.signInAnonymously();
        debugPrint("Signed in with temporary account. ${userCredential.user?.uid}");
      },
      onError: (e) {
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case "operation-not-allowed":
              debugPrint("Bu proje için anonim kimlik doğrulama etkinleştirilmedi");
              break;
            default:
              debugPrint("Bilinmeyen hata");
          }
        }
        debugPrint("Anonim giriş hatası: $e");
      },
    );
  }

  // Giriş yapma işlemi
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return handleErrors(
      operation: () async {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint(userCredential.user?.uid);
      },
      onError: (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'invalid-email') {
            throw Exception('E-posta adresi geçersizdir, bilgilerinizi kontrol ediniz.');
          } else if (e.code == 'invalid-credential') {
            throw Exception('Kimlik doğrulama bilgileriniz yanlış, bilgilerinizi kontrol ediniz.');
          } else {
            throw Exception("Bir hata oluştu: ${e.message}");
          }
        }
        debugPrint("Giriş hatası: $e");
      },
    );
  }

  // Çıkış yapma işlemi
  Future<void> signOut() async {
    return handleErrors(
      operation: () async {
        await googleSignIn.signOut();
        await _auth.signOut();
      },
      onError: (e) {
        debugPrint("Çıkış hatası: $e");
      },
    );
  }

  // Kullanıcı bilgilerini getirme
  Future<UserModel?> getUser() async {
    return handleErrors(
      operation: () async {
        if (currentUser != null) {
          var userInfo = await _db.collection("users").doc(currentUser!.uid).get();
          var userJson = userInfo.data();
          return UserModel.fromMap(userJson!);
        }
        return null;
      },
      onError: (e) {
        debugPrint("Kullanıcı bilgisi getirme hatası: $e");
      },
    );
  }

  // Şifre sıfırlama işlemi
  Future<void> resetPassword(String email) async {
    return handleErrors(
      operation: () async {
        await _auth.sendPasswordResetEmail(email: email);
      },
      onError: (e) {
        debugPrint("Şifre sıfırlama hatası: $e");
        throw Exception("Şifre sıfırlama işlemi başarısız oldu.");
      },
    );
  }

  // Hesap silme işlemi
  Future<void> deleteAccount() async {
    return handleErrors(
      operation: () async {
        User? user = currentUser;
        if (user != null) {
          // Firestore'dan kullanıcı verilerini silme
          await _db.collection("users").doc(user.uid).delete();

          // Authentication'dan kullanıcıyı silme
          await user.delete();
        }
      },
      onError: (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'requires-recent-login') {
            throw Exception("Hesabınızı silmek için yeniden giriş yapmanız gerekiyor.");
          } else {
            throw Exception("Hesap silme hatası: ${e.message}");
          }
        }
        debugPrint("Hesap silme hatası: $e");
        throw Exception("Bir hata oluştu: $e");
      },
    );
  }

  // Şifre değiştirme işlemi
  Future<void> changePassword(String currentPassword, String newPassword) async {
    return handleErrors(
      operation: () async {
        User? user = _auth.currentUser;
        if (user != null) {
          final cred = EmailAuthProvider.credential(
            email: user.email!,
            password: currentPassword,
          );

          // Kullanıcının mevcut şifresini doğrulamak için re-authentication yapıyoruz.
          await user.reauthenticateWithCredential(cred);
          // Yeni şifreyi ayarlıyoruz.
          await user.updatePassword(newPassword);

          debugPrint("Şifre başarıyla güncellendi.");
        }
      },
      onError: (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'wrong-password') {
            throw Exception("Mevcut şifre yanlış.");
          } else {
            throw Exception("Şifre değiştirme hatası: ${e.message}");
          }
        }
        debugPrint("Şifre değiştirme hatası: $e");
        throw Exception("Bir hata oluştu: $e");
      },
    );
  }
}
