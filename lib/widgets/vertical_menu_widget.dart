import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerticalMenuWidget extends StatelessWidget {
  const VerticalMenuWidget({super.key, required svgImage, required menuText})
    : _svgImage = svgImage,
      _menuText = menuText;

  final String _svgImage;
  final String _menuText;

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
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: width * 0.04,
                children: [
                  SvgPicture.asset(
                    _svgImage,
                    height: height * 0.03,
                    colorFilter: ColorFilter.mode(
                      Color.fromRGBO(186, 136, 130, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(_menuText, style: TextStyle(color: Colors.white)),
                ],
              ),
              SvgPicture.asset(
                'assets/images/ModuleA/003/chevron_right.svg',
                height: height * 0.03,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
