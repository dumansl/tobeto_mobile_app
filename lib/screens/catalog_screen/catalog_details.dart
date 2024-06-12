import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/catalog_details_lesson_image.dart';

class CatalogDetailsScreen extends StatefulWidget {
  const CatalogDetailsScreen({super.key});

  @override
  State<CatalogDetailsScreen> createState() => _CatalogDetailsScreenState();
}

class _CatalogDetailsScreenState extends State<CatalogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Row(
            children: [CatalogLessonImage()],
          ),
        ],
      ),
    );
  }
}
