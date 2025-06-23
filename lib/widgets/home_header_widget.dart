import 'dart:io';

import 'package:drivemate/widgets/svg_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../view/have_choice.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.carImage,
    required this.carName,
    required this.carNumber,
    this.centerText = '',
  });

  final File carImage;
  final String carName;
  final String carNumber;
  final String centerText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(169, 169, 169, 1.0),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            minWidth: width * 0.3,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => HaveChoice(
                        carImage: carImage,
                        carName: carName,
                        carNumber: carNumber,
                      ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  carName,
                  style: TextStyle(
                    fontSize: height * 0.035,
                    fontFamily: 'noto_sans_medium',
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/ModuleA/003/chevron_right.svg',
                  height: height * 0.035,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.3,
            child: Center(
              child: Text(
                centerText,
                style: TextStyle(
                  fontSize: height * 0.04,
                  fontFamily: 'noto_sans_bold',
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.3,
            child: Row(
              children: [
                SvgIconButtonWidget(
                  svgImage: 'assets/images/ModuleB/003/notifications.svg',
                ),
                SvgIconButtonWidget(
                  svgImage: 'assets/images/ModuleB/003/settings.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
