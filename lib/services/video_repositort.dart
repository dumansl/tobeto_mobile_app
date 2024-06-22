import 'package:firebase_storage/firebase_storage.dart';

class VideoRepository {
  final FirebaseStorage storage;

  VideoRepository(this.storage);

  // Mevcut URL'yi kullanarak video URL'sini döndüren yöntem
  Future<String> fetchVideoUrl(String videoUrl) async {
    try {
      // Doğrudan URL'yi döndür
      return videoUrl;
    } catch (e) {
      throw Exception('Failed to fetch video URL: $e');
    }
  }
}
