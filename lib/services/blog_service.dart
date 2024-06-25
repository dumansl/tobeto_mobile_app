import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';

class BlogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Blog>> fetchBlogs() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('blog').get();
      List<Blog> blogs = snapshot.docs.map((doc) {
        debugPrint("Fetched blog data: ${doc.data()}");
        return Blog.fromFirestore(doc);
      }).toList();
      return blogs;
    } catch (e) {
      debugPrint('Error fetching blogs: $e');
      throw Exception('Error fetching blogs: $e');
    }
  }

  Future<void> addBlog(Blog blog) async {
    try {
      await _firestore.collection('blog').add(blog.toFirestore());
    } catch (e) {
      debugPrint('Error adding blog: $e');
      throw Exception('Error adding blog: $e');
    }
  }
}
