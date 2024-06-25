part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBlogsEvent extends BlogEvent {}
