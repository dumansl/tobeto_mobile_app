import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'blog_details.dart';
import 'package:tobeto_mobile_app/blocs/blog_bloc/blog_bloc.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(
        isTobetoScreen: true,
      ),
      body: BlocProvider(
        create: (context) => BlogBloc()..add(LoadBlogsEvent()),
        child: const BlogList(),
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is BlogLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BlogLoadedState) {
          final sortedBlogs = state.blogs..sort((a, b) => b.date.compareTo(a.date));

          return ListView.builder(
            itemCount: sortedBlogs.length,
            itemBuilder: (context, index) {
              final blog = sortedBlogs[index];
              return BlogCard(blog: blog, allBlogs: sortedBlogs);
            },
          );
        } else if (state is BlogErrorState) {
          return const Center(child: Text('Error loading blogs'));
        }
        return Container();
      },
    );
  }
}

class BlogCard extends StatelessWidget {
  final Blog blog;
  final List<Blog> allBlogs;

  const BlogCard({super.key, required this.blog, required this.allBlogs});

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
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
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
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
                      style: TobetoTextStyle.poppins(context).captionGrayThin12,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      blog.title,
                      style: TobetoTextStyle.poppins(context).bodyBlackBold16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
