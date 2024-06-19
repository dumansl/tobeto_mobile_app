import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFScreen extends StatefulWidget {
  final String title;
  final String pdfUrl;

  const PDFScreen({
    super.key,
    required this.pdfUrl,
    required this.title,
  });

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String? localFilePath;

  @override
  void initState() {
    super.initState();
    _downloadPDF(widget.pdfUrl);
  }

  Future<void> _downloadPDF(String pdfUrl) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/downloaded_file.pdf');

    if (!await file.exists()) {
      final dio = Dio();
      await dio.download(pdfUrl, file.path);
      setState(() {
        localFilePath = file.path;
      });
    } else {
      setState(() {
        localFilePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: localFilePath != null
          ? PDFView(filePath: localFilePath!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
