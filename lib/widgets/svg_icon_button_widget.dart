import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButtonWidget extends StatefulWidget {
  const SvgIconButtonWidget({super.key, required sgImage})
    : _svgImage = sgImage;

  final String _svgImage;

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
      onPressed: () {},
      icon: SvgPicture.asset(
        widget._svgImage,
        height: height * 0.04,
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }
}
