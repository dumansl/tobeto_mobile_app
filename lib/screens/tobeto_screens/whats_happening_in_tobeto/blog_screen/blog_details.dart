import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tobeto_mobile_app/blocs/blog_bloc/blog_bloc.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';

class BlogDetails extends StatefulWidget {
  final Blog blog;
  final List<Blog> allBlogs;

  BlogDetails({required this.blog, required this.allBlogs});

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  void _shareContent() {
    String shareText = "${widget.blog.title}\n\n${widget.blog.content}\n\nRead more at: ${widget.blog.image}";
    Share.share(shareText, subject: 'Check out this blog!');
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = widget.allBlogs.indexOf(widget.blog);
    final bool hasPrevious = currentIndex > 0;
    final bool hasNext = currentIndex < widget.allBlogs.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Detayları', style: TextStyle(fontFamily: 'Poppins')),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
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
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.blog.title,
                      style: TextStyle(
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
              SizedBox(height: 8.0),
              Divider(),
              SizedBox(height: 8.0),
              Image.network(widget.blog.image),
              SizedBox(height: 16.0),
              Text(
                widget.blog.content,
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SizedBox(height: 16.0),
            ],
          ),
          SizedBox(height: 100), // FAB için boşluk bıraktık
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
                icon: Icon(Icons.arrow_back),
                label: Text('Önceki', style: TextStyle(fontFamily: 'Poppins')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
              ),
              FloatingActionButton(
                onPressed: _shareContent,
                backgroundColor: Colors.white,
                child: Icon(Icons.share, color: Colors.purple),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Sonraki', style: TextStyle(fontFamily: 'Poppins')),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
