import 'package:flutter/material.dart';

class SingleColorWidget extends StatelessWidget {
  const SingleColorWidget({
    super.key,
    required String simpleButtonText,
    required Color simpleButtonColor,
    required Color simpleButtonTextColor,
    this.magicNumber,
  }) : _simpleButtonText = simpleButtonText,
       _simpleButtonColor = simpleButtonColor,
       _simpleButtonTextColor = simpleButtonTextColor;

  final String _simpleButtonText;
  final Color _simpleButtonColor;
  final Color _simpleButtonTextColor;
  final int? magicNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Container(
      width: width * 0.775,
      height: height * 0.06,
      color: _simpleButtonColor,

      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateColor.resolveWith(
            (states) => Colors.transparent,
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () {},
        child: Text(
          _simpleButtonText,
          style: TextStyle(
            color: _simpleButtonTextColor,
            fontFamily: 'noto_sans_bold',
            fontSize: height * 0.018,
          ),
        ),
      ),
    );
  }
}
