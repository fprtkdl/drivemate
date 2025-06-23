import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButtonWidget extends StatefulWidget {
  const SvgIconButtonWidget({super.key, required this.svgImage, this.clickEvent});

  final String svgImage;
  final VoidCallback? clickEvent;

  @override
  State<StatefulWidget> createState() => SvgIconButtonWidgetState();
}

class SvgIconButtonWidgetState extends State<SvgIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: widget.clickEvent,
      icon: SvgPicture.asset(
        widget.svgImage,
        height: height * 0.04,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }
}
