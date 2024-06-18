import 'package:firebase_storage/firebase_storage.dart';

class VideoRepository {
  final FirebaseStorage storage;

  VideoRepository(this.storage);

  Future<String> fetchVideoUrl() async {
    try {
      final ref = storage.ref().child('educations/VID_20231031_160327.mp4');
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw Exception('Failed to fetch video URL: $e');
    }
  }
}
