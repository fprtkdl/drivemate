import 'dart:io';

import 'package:flutter/material.dart';

class FileTypeImageFrameWidget extends StatelessWidget {
  const FileTypeImageFrameWidget({
    super.key,
    required fileTypeImage,
    required imageHeight,
    double? topGap = 0,
    double? bottomGap = 0,
  }) : _fileTypeImage = fileTypeImage,
       _imageHeight = imageHeight,
       _topGap = topGap,
       _bottomGap = bottomGap;

  final File _fileTypeImage;
  final double? _imageHeight;
  final double? _topGap;
  final double? _bottomGap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    return Column(
      children: [
        SizedBox(height: _topGap),
        Container(
          width: width,
          height: _imageHeight,
          color: Colors.black,
          child: Image.file(_fileTypeImage, fit: BoxFit.contain),
        ),
        SizedBox(height: _bottomGap),
      ],
    );
  }
}
