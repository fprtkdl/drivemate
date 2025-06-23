import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusPageCarChildWidget extends StatefulWidget {
  const StatusPageCarChildWidget({
    super.key,
    required this.svgImage,
    required this.barBtnText,
    this.state = false,
  });

  final String svgImage;
  final String barBtnText;
  final bool state;

  @override
  State<StatefulWidget> createState() => StatusPageCarChildWidgetState();
}

class StatusPageCarChildWidgetState extends State<StatusPageCarChildWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    final selectedColor = const Color.fromRGBO(186, 136, 130, 1);
    final textColor = widget.state ? selectedColor : Colors.black;
    final iconColor = widget.state ? selectedColor : Colors.black54;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: SizedBox(
        height: height * 0.08,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    widget.svgImage,
                    height: height * 0.04,
                    colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    widget.barBtnText,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontFamily: 'noto_sans_bold',
                    ),
                  ),
                ],
              ),
              Text(
                widget.state ? '열림' : '닫힘',
                style: TextStyle(
                  color: iconColor,
                  fontSize: height * 0.02,
                  fontFamily: 'noto_sans_bold',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
