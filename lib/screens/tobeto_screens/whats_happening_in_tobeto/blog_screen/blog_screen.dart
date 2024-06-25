import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/services/blog_service.dart';
import 'blog_details.dart';
import 'package:tobeto_mobile_app/blocs/blog_bloc/blog_bloc.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});
  // TO DO : Zehra Karaca
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FixedAppbar(
        isTobetoScreen: true,
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is BlogLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BlogLoadedState) {
          // Blogları tarihe göre sıralayın (en güncelden en eskiye)
          final sortedBlogs = state.blogs..sort((a, b) => b.date.compareTo(a.date));

          return ListView.builder(
            itemCount: sortedBlogs.length,
            itemBuilder: (context, index) {
              final blog = sortedBlogs[index];
              return BlogCard(blog: blog, allBlogs: sortedBlogs);
            },
          );
        } else if (state is BlogErrorState) {
          return Center(child: Text('Error loading blogs'));
        }
        return Container();
      },
    );
  }
}

class BlogCard extends StatelessWidget {
  final Blog blog;
  final List<Blog> allBlogs;

  BlogCard({required this.blog, required this.allBlogs});

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogDetails(blog: blog, allBlogs: allBlogs),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  blog.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatDate(blog.date),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      blog.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2, // Metin iki satırla sınırlıdır.
                      overflow: TextOverflow.ellipsis, // Taşan metin üç nokta ile gösterilir.
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
