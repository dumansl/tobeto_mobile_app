import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  // Kullanıcı bilgilerini kaydetme
  Future<void> registerUser({
    required User user,
    required String name,
    required String lastName,
    required String email,
  }) async {
    await _db.collection("users").doc(user.uid).set({
      'firstName': name,
      'lastName': lastName,
      'email': email,
    });
  }

  // Kaydolma işlemi
  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String lastName}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await registerUser(
          user: user,
          name: name,
          lastName: lastName,
          email: email,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw Exception("Bu şifre çok zayıf");
      } else if (e.code == "email-already-in-use") {
        throw Exception("Bu e-posta için hesap zaten mevcut");
      } else {
        throw Exception("Bir hata oluştu: ${e.message}");
      }
    } catch (e) {
      debugPrint("Kaydolma hatası: $e");
    }
  }

  // Google ile giriş yapma işlemi
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(authCredential);
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
    } on FirebaseAuthException catch (e) {
      debugPrint("Google ile giriş hatası: ${e.message}");
    }
  }

  // Misafir olarak giriş
  Future<void> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      debugPrint(
          "Signed in with temporary account. ${userCredential.user?.uid}");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Bu proje için anonim kimlik doğrulama etkinleştirilmedi");
          break;
        default:
          debugPrint("Bilinmeyen hata");
      }
    }
  }

  // Giriş yapma işlemi
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(userCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('Bu e-posta için kullanıcı bulunamadı.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Bu kullanıcı için yanlış şifre girildi.');
      } else {
        throw Exception("Bir hata oluştu: ${e.message}");
      }
    } catch (e) {
      debugPrint("Giriş hatası: $e");
    }
  }

  // Çıkış yapma işlemi
  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      debugPrint("Çıkış hatası: $e");
    }
  }

  // Kullanıcı bilgilerini getirme
  Future<UserModel?> getUser() async {
    try {
      if (currentUser != null) {
        var userInfo =
            await _db.collection("users").doc(currentUser!.uid).get();
        var userJson = userInfo.data();
        return UserModel.fromMap(userJson!);
      }
    } catch (e) {
      debugPrint("Kullanıcı bilgisi getirme hatası: $e");
    }
    return null;
  }

  // Şifre sıfırlama işlemi
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint("Şifre sıfırlama hatası: $e");
      throw Exception("Şifre sıfırlama işlemi başarısız oldu.");
    }
  }

  // Hesap silme işlemi
  Future<void> deleteAccount() async {
    try {
      User? user = currentUser;
      if (user != null) {
        // Firestore'dan kullanıcı verilerini silme
        await _db.collection("users").doc(user.uid).delete();

        // Authentication'dan kullanıcıyı silme
        await user.delete();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw Exception(
            "Hesabınızı silmek için yeniden giriş yapmanız gerekiyor.");
      } else {
        throw Exception("Hesap silme hatası: ${e.message}");
      }
    } catch (e) {
      debugPrint("Hesap silme hatası: $e");
      throw Exception("Bir hata oluştu: $e");
    }
  }
}
