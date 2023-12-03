import 'dart:html';
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:fukuoka_flutter_fanclub/features/atoms/responsive.dart';

class HTMLDisplayWidget extends StatelessWidget {
  final String viewId;
  final String url;
  const HTMLDisplayWidget({super.key, required this.viewId, required this.url});

  @override
  Widget build(BuildContext context) {
    final width =
        Responsive.isMobile(context) ? MediaQuery.sizeOf(context).width : 605.0;

    const height = 350.0;
    ui.platformViewRegistry.registerViewFactory(
      viewId,
      (int viewId) => IFrameElement()
        ..height = height.toString()
        ..width = width.toString()
        ..style.border = '0'
        ..referrerPolicy = 'no-referrer-when-downgrade'
        // ignore: unsafe_html
        ..src = url,
    );

    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: HtmlElementView(
          viewType: viewId,
        ),
      ),
    );
  }
}
