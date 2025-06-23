import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: height * 0.01,
      children: [
        SvgPicture.asset(
          'assets/images/ModuleA/003/splash_img.svg',
          width: height * 0.06,
          height: height * 0.06,
          colorFilter: const ColorFilter.mode(
            Color.fromRGBO(186, 136, 130, 1),
            BlendMode.srcIn,
          ),
        ),
        Text(
          'Drive Mate',
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.03,
            fontFamily: 'noto_sans_bold',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
