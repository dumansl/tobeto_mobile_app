part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  @override
  List<Object> get props => [];
}

class BlogInitialState extends BlogState {}

class BlogLoadingState extends BlogState {}

class BlogLoadedState extends BlogState {
  final List<Blog> blogs;

  BlogLoadedState({required this.blogs});

  @override
  List<Object> get props => [blogs];
}

class BlogErrorState extends BlogState {}
