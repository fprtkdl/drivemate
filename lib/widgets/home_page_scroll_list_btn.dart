import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageScrollListBtn extends StatelessWidget {
  const HomePageScrollListBtn({
    super.key,
    required this.svgImage,
    required this.menuText,
  });

  final String svgImage;
  final String menuText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: SizedBox(
        height: height * 0.0625,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    svgImage,
                    height: height * 0.03,
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(186, 136, 130, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Text(menuText, style: const TextStyle(color: Colors.white)),
                ],
              ),
              SvgPicture.asset(
                'assets/images/ModuleA/003/chevron_right.svg',
                height: height * 0.03,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
