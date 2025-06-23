import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageIconTextButton extends StatefulWidget {
  const HomePageIconTextButton({
    super.key,
    required this.svgImg,
    this.selectedImg,
    required this.buttonText,
    required this.isSelected,
    this.changed,
  });

  final String svgImg;
  final String? selectedImg;
  final String buttonText;
  final bool isSelected;
  final VoidCallback? changed;

  @override
  State<StatefulWidget> createState() => HomePageIconTextButtonState();
}

class HomePageIconTextButtonState extends State<HomePageIconTextButton> {
  static const transparent = Colors.transparent;
  static const black = Colors.black;
  static const white = Colors.white;

  Timer? _timer;
  bool warningColorState = false;
  Color iconColor = white;

  void _startBlink() {
    setState(() {
      warningColorState = !widget.isSelected;
      iconColor = white;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        iconColor = warningColorState ? Colors.red : white;
      });
    });
  }

  void _stopBlink() {
    _timer?.cancel();
    setState(() {
      warningColorState = widget.isSelected;
    });
  }

  Color _buttonColor() {
    if (widget.svgImg == 'assets/images/ModuleB/003/warning.svg') {
      return widget.isSelected ? white : black;
    }

    return widget.isSelected ? white : black;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    final lockImgChange =
        widget.selectedImg == null
            ? widget.svgImg
            : (widget.isSelected ? widget.selectedImg : widget.svgImg);

    return Column(
      children: [
        Container(
          width: width * 0.175,
          height: width * 0.175,
          decoration: BoxDecoration(
            border: Border.all(color: black, width: 2),
            color: widget.isSelected ? black : transparent,
            borderRadius: BorderRadius.circular(height * 0.01),
          ),
          child: IconButton(
            splashColor: transparent,
            highlightColor: transparent,
            onPressed: () {
              setState(() {
                widget.changed?.call();
                lockImgChange;
                if (widget.svgImg == 'assets/images/ModuleB/003/warning.svg' &&
                    widget.isSelected) {
                  _startBlink();
                } else {
                  _stopBlink();
                }
              });
            },
            icon: SvgPicture.asset(
              lockImgChange!,
              colorFilter: ColorFilter.mode(_buttonColor(), BlendMode.srcIn),
              height: width * 0.175,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.175,
          height: height * 0.035,
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontSize: height * 0.02,
                fontFamily: 'noto_sans_medium',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
