abstract class VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final String videoUrl;
  VideoLoaded(this.videoUrl);
}

class VideoError extends VideoState {
  final String message;
  VideoError(this.message);
}
