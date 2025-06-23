import 'dart:io';

import 'package:flutter/material.dart';

class FileTypeImageFrameWidget extends StatelessWidget {
  const FileTypeImageFrameWidget({
    super.key,
    required this.fileTypeImage,
    required this.imageHeight,
    this.topGap = 0,
    this.bottomGap = 0,
  });

  final File fileTypeImage;
  final double? imageHeight;
  final double topGap;
  final double bottomGap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (topGap > 0) SizedBox(height: topGap),
        Container(
          height: imageHeight,
          color: Colors.black,
          child: Image.file(fileTypeImage, fit: BoxFit.contain),
        ),
        if (bottomGap > 0) SizedBox(height: bottomGap),
      ],
    );
  }
}
