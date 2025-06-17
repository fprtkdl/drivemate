import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageIconTextButton extends StatefulWidget {
  const HomePageIconTextButton({
    super.key,
    required String svgImg,
    String? selectedImg,
    required String buttonText,
    required bool isSelected,
    VoidCallback? changed,
  }) : _svgImg = svgImg,
       _selectedImg = selectedImg,
       _buttonText = buttonText,
       _isSelected = isSelected,
       _changed = changed;

  final String _svgImg;
  final String? _selectedImg;
  final String _buttonText;
  final bool _isSelected;
  final VoidCallback? _changed;

  @override
  State<StatefulWidget> createState() => HomePageIconTextButtonState();
}

class HomePageIconTextButtonState extends State<HomePageIconTextButton> {
  Color transparent = Colors.transparent;
  Color black = Colors.black;
  Color white = Colors.white;

  Timer? _timer;
  bool warningColorState = false;
  Color iconColor = Colors.white;

  void _blinkStart() {
    setState(() {
      warningColorState = !widget._isSelected;
      iconColor = white;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        iconColor = warningColorState ? Colors.red : white;
      });
    });
  }

  void _blinkStop() {
    _timer?.cancel();
    setState(() {
      warningColorState = widget._isSelected;
    });
  }

  Color _buttonColor() {
    if (widget._svgImg == 'assets/images/ModuleB/003/warning.svg') {
      return widget._isSelected ? white : black;
    }

    return widget._isSelected ? white : black;
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
        widget._selectedImg == null
            ? widget._svgImg
            : (widget._isSelected ? widget._selectedImg : widget._svgImg);

    return Column(
      children: [
        Container(
          width: width * 0.175,
          height: width * 0.175,
          decoration: BoxDecoration(
            border: Border.all(color: black, width: 2),
            color: widget._isSelected ? black : transparent,
            borderRadius: BorderRadius.circular(height * 0.01),
          ),
          child: IconButton(
            splashColor: transparent,
            highlightColor: transparent,
            onPressed: () {
              setState(() {
                widget._changed?.call();
                lockImgChange;
                if (widget._svgImg == 'assets/images/ModuleB/003/warning.svg' &&
                    widget._isSelected) {
                  _blinkStart();
                } else {
                  _blinkStop();
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
              widget._buttonText,
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
