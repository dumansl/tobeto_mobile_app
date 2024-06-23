import 'package:equatable/equatable.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final String videoUrl;

  const VideoLoaded({required this.videoUrl});

  @override
  List<Object> get props => [videoUrl];
}

class VideoError extends VideoState {
  final String message;

  const VideoError({required this.message});

  @override
  List<Object> get props => [message];
}
