import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tobeto_mobile_app/model/blog_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class BlogDetails extends StatefulWidget {
  final Blog blog;
  final List<Blog> allBlogs;

  const BlogDetails({super.key, required this.blog, required this.allBlogs});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.allBlogs.indexOf(widget.blog);
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _shareContent(Blog blog) {
    String shareText = "${blog.title}\n\n${blog.content}\n\nRead more at: ${blog.image}";
    Share.share(shareText, subject: 'Check out this blog!');
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const FixedAppbar(
        isTobetoScreen: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.allBlogs.length,
        itemBuilder: (context, index) {
          final blog = widget.allBlogs[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(blog.image),
                          radius: 20,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            blog.title,
                            style: TobetoTextStyle.poppins(context).captionBlackBold18,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    const Divider(),
                    const SizedBox(height: 8.0),
                    Image.network(blog.subImage),
                    const SizedBox(height: 16.0),
                    Text(
                      blog.content,
                      style: TobetoTextStyle.poppins(context).bodyBlackLight16,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: index > 0
                              ? () {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              : null,
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Önceki', style: TextStyle(fontFamily: 'Poppins')),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () => _shareContent(blog),
                          backgroundColor: isDarkMode ? TobetoColor.formField.darkGrey : TobetoColor.card.cream,
                          child: const Icon(Icons.share, color: Colors.purple),
                        ),
                        ElevatedButton(
                          onPressed: index < widget.allBlogs.length - 1
                              ? () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
