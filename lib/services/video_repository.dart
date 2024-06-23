import 'package:firebase_storage/firebase_storage.dart';

class VideoRepository {
  final FirebaseStorage storage;

  VideoRepository(this.storage);

  Future<String> fetchVideoUrl(String videoUrl) async {
    try {
      return videoUrl;
    } catch (e) {
      throw Exception('Failed to fetch video URL: $e');
    }
  }
}
