import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusPageCarChildWidget extends StatefulWidget {
  const StatusPageCarChildWidget({
    super.key,
    required svgImage,
    required barBtnText,
    bool? state = false,
  }) : _svgImage = svgImage,
       _barBtnText = barBtnText,
       _state = state;

  final String _svgImage;
  final String _barBtnText;
  final bool? _state;

  @override
  State<StatefulWidget> createState() => StatusPageCarChildWidgetState();
}

class StatusPageCarChildWidgetState extends State<StatusPageCarChildWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: SizedBox(
        height: height * 0.08,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: width * 0.04,
                children: [
                  SvgPicture.asset(
                    widget._svgImage,
                    height: height * 0.04,
                    colorFilter: ColorFilter.mode(
                      widget._state!
                          ? Color.fromRGBO(186, 136, 130, 1)
                          : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    widget._barBtnText,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontFamily: 'noto_sans_bold',
                    ),
                  ),
                ],
              ),
              Text(
                widget._state! ? '열림' : '닫힘',
                style: TextStyle(
                  color:
                      widget._state!
                          ? Color.fromRGBO(186, 136, 130, 1)
                          : Colors.black54,
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
