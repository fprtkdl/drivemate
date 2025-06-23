import 'package:flutter/material.dart';

import '../view/choice_page.dart';

class RadialGradientButtonWidget extends StatefulWidget {
  const RadialGradientButtonWidget({
    super.key,
    required this.gradientButtonText,
    required this.eventCode,
  });

  final String gradientButtonText;
  final int eventCode;
  @override
  State<StatefulWidget> createState() => RadialGradientButtonWidgetState();
}

class RadialGradientButtonWidgetState
    extends State<RadialGradientButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Container(
      width: width * 0.9,
      height: height * 0.07,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          radius: 4.5,
          center: Alignment.center,
          colors: [
            Color.fromRGBO(4, 4, 4, 1.0),
            Color.fromRGBO(44, 44, 44, 1.0),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateColor.resolveWith(
            (states) => Colors.transparent,
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () {
          if (widget.eventCode == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChoicePage()),
            );
          }
        },
        child: Text(
          widget.gradientButtonText,
          style: TextStyle(
            color: Color.fromRGBO(186, 136, 130, 1),
            fontFamily: 'noto_sans_medium',
            fontSize: height * 0.02,
          ),
        ),
      ),
    );
  }
}
