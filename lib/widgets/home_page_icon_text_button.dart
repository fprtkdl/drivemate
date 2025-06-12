import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageIconTextButton extends StatefulWidget {
  const HomePageIconTextButton({
    super.key,
    required String svgImg,
    String? selectedImg,
    required String buttonText,
  }) : _svgImg = svgImg,
       _selectedImg = selectedImg,
       _buttonText = buttonText;

  final String _svgImg;
  final String? _selectedImg;
  final String _buttonText;

  @override
  State<StatefulWidget> createState() => HomePageIconTextButtonState();
}

class HomePageIconTextButtonState extends State<HomePageIconTextButton> {
  bool _isSelected = false;
  Timer? _timer;
  Color warningColorState = Colors.black; // basic

  void _blinkStart() {
    setState(() {
      warningColorState = Colors.white;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        warningColorState =
            warningColorState == Colors.white ? Colors.red : Colors.white;
      });
    });
  }

  void _blinkStop() {
    _timer?.cancel();
    setState(() {
      warningColorState = Colors.black;
    });
  }

  Color _buttonColorChange() {
    if (widget._svgImg == 'assets/images/ModuleB/003/warning.svg') {
      return warningColorState;
    } else {
      return _isSelected ? Colors.white : Colors.black;
    }
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
            : (_isSelected ? widget._selectedImg : widget._svgImg);

    return Column(
      children: [
        Container(
          width: width * 0.175,
          height: width * 0.175,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: _isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(height * 0.01),
          ),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                _isSelected = !_isSelected;
                if (widget._svgImg == 'assets/images/ModuleB/003/warning.svg' &&
                    _isSelected) {
                  _blinkStart();
                } else {
                  _blinkStop();
                }
              });
            },
            icon: SvgPicture.asset(
              lockImgChange!,
              colorFilter: ColorFilter.mode(
                _buttonColorChange(),
                BlendMode.srcIn,
              ),
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
