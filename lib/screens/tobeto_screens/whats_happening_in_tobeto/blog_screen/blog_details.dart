import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';

class BlogDetails extends StatefulWidget {
  final Blog blog;
  final List<Blog> allBlogs;

  const BlogDetails({super.key, required this.blog, required this.allBlogs});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  void _shareContent() {
    String shareText =
        "${widget.blog.title}\n\n${widget.blog.content}\n\nRead more at: ${widget.blog.image}";
    Share.share(shareText, subject: 'Check out this blog!');
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = widget.allBlogs.indexOf(widget.blog);
    final bool hasPrevious = currentIndex > 0;
    final bool hasNext = currentIndex < widget.allBlogs.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Detayları',
            style: TextStyle(fontFamily: 'Poppins')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.blog.image),
                    radius: 20,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.blog.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),
              Image.network(widget.blog.image),
              const SizedBox(height: 16.0),
              Text(
                widget.blog.content,
                style: const TextStyle(fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
          const SizedBox(height: 100), // FAB için boşluk bıraktık
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: hasPrevious
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDetails(
                              blog: widget.allBlogs[currentIndex - 1],
                              allBlogs: widget.allBlogs,
                            ),
                          ),
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Önceki',
                    style: TextStyle(fontFamily: 'Poppins')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
              ),
              FloatingActionButton(
                onPressed: _shareContent,
                backgroundColor: Colors.white,
                child: const Icon(Icons.share, color: Colors.purple),
              ),
              ElevatedButton(
                onPressed: hasNext
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDetails(
                              blog: widget.allBlogs[currentIndex + 1],
                              allBlogs: widget.allBlogs,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Sonraki', style: TextStyle(fontFamily: 'Poppins')),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
