import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

import 'firebase_service.provider.dart';

class BlogService {
  FirebaseFirestore get _firestore => FirebaseServiceProvider().firestore;

  Future<List<Blog>> fetchBlogs() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot = await _firestore.collection('blog').get();
        List<Blog> blogs = snapshot.docs.map((doc) {
          debugPrint("Fetched blog data: ${doc.data()}");
          return Blog.fromFirestore(doc);
        }).toList();
        return blogs;
      },
      onError: (e) {
        debugPrint('Error fetching blogs: $e');
        throw Exception('Error fetching blogs: $e');
      },
    );
  }

  Future<void> addBlog(Blog blog) async {
    return handleErrors(
      operation: () async {
        await _firestore.collection('blog').add(blog.toFirestore());
      },
      onError: (e) {
        debugPrint('Error adding blog: $e');
        throw Exception('Error adding blog: $e');
      },
    );
  }
}
