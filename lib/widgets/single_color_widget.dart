import 'package:flutter/material.dart';

class SingleColorWidget extends StatelessWidget {
  const SingleColorWidget({
    super.key,
    required this.simpleButtonText,
    required this.simpleButtonColor,
    required this.simpleButtonTextColor,
    this.clickEvent
  });

  final String simpleButtonText;
  final Color simpleButtonColor;
  final Color simpleButtonTextColor;
  final VoidCallback? clickEvent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width * 0.775,
      height: size.height * 0.06,
      color: simpleButtonColor,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateColor.resolveWith((_) => Colors.transparent),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: clickEvent,
        child: Text(
          simpleButtonText,
          style: TextStyle(
            color: simpleButtonTextColor,
            fontFamily: 'noto_sans_bold',
            fontSize: size.height * 0.018,
          ),
        ),
      ),
    );
  }
}
