import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class FetchVideo extends VideoEvent {
  final String videoUrl;

  const FetchVideo(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}
