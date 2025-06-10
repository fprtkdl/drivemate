import 'package:flutter/material.dart';

class LinearGradientButtonWidget extends StatefulWidget {
  const LinearGradientButtonWidget({
    super.key,
    required String gradientButtonText,
    this.onPressedCustom,
  }) : _gradientButtonText = gradientButtonText;

  final String _gradientButtonText;
  final VoidCallback? onPressedCustom;

  @override
  State<StatefulWidget> createState() => LinearGradientButtonWidgetState();
}

class LinearGradientButtonWidgetState
    extends State<LinearGradientButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Container(
      width: width * 0.9,
      height: height * 0.07,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(222, 3, 36, 1),
            Color.fromRGBO(172, 2, 28, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () {

          widget.onPressedCustom?.call();
        },
        child: Text(
          widget._gradientButtonText,
          style: TextStyle(color: Colors.white, fontFamily: 'noto_sans_bold'),
        ),
      ),
    );
  }
}
