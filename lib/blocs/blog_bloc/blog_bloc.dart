import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/services/blog_service.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogService _blogService = BlogService();

  BlogBloc() : super(BlogInitialState()) {
    on<LoadBlogsEvent>(_onLoadBlogsEvent);
  }

  void _onLoadBlogsEvent(LoadBlogsEvent event, Emitter<BlogState> emit) async {
    emit(BlogLoadingState());
    try {
      List<Blog> blogs = await _blogService.fetchBlogs();
      emit(BlogLoadedState(blogs: blogs));
    } catch (e) {
      debugPrint('Error in Bloc: $e');
      emit(BlogErrorState());
    }
  }
}
