import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubState extends StatefulWidget {
  const SubState({super.key, required subIcon, required subText})
    : _subIcon = subIcon,
      _subText = subText;

  final String _subIcon;
  final String _subText;

  @override
  State<StatefulWidget> createState() => SubStateState();
}

class SubStateState extends State<SubState> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Container(
      height: height * 0.035,
      margin: EdgeInsets.symmetric(horizontal: width * 0.035),
      child: Row(
        spacing: width * 0.01,
        children: [
          SvgPicture.asset(
            widget._subIcon,
            height: height * 0.025,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          Text(
            widget._subText,
            style: TextStyle(
              fontSize: height * 0.0175,
              fontFamily: 'noto_sans_medium',
            ),
          ),
        ],
      ),
    );
  }
}
