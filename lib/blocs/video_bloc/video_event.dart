abstract class VideoEvent {}

class FetchVideo extends VideoEvent {
  final String videoUrl;

  FetchVideo(this.videoUrl);
}
