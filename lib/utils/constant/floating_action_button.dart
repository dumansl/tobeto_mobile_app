import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_android/webview_flutter_android.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  void _openLink(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: TobetoColor.purple,
      children: [
        SpeedDialChild(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset('assets/icons/facebook.png', colorBlendMode: BlendMode.dstATop, fit: BoxFit.cover),
          ),
          onTap: () => _openLink(context, 'https://www.facebook.com'),
        ),
        SpeedDialChild(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset('assets/icons/instagram.png', fit: BoxFit.cover),
          ),
          onTap: () => _openLink(context, 'https://www.instagram.com/tobeto_official/?hl=en'),
        ),
        SpeedDialChild(
          shape: const CircleBorder(),
          child: ClipOval(
            child: Image.asset('assets/icons/linkedIn.png', fit: BoxFit.cover),
          ),
          onTap: () => _openLink(context, 'https://www.linkedin.com/company/tobeto/?originalSubdomain=tr'),
        ),
        SpeedDialChild(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset('assets/icons/twitter.png', fit: BoxFit.cover),
          ),
          onTap: () => _openLink(context, 'https://www.x.com/tobeto_platform'),
        ),
      ],
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  // ignore: library_private_types_in_public_api
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
