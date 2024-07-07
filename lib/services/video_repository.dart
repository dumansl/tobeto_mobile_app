import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class VideoRepository {
  FirebaseStorage get storage => FirebaseServiceProvider().storage;

  Future<String> fetchVideoUrl(String videoUrl) async {
    return handleErrors(
      operation: () async {
        return videoUrl;
      },
      onError: (e) {
        throw Exception('Failed to fetch video URL: $e');
      },
    );
  }
}
