import 'dart:io';

import 'package:drivemate/widgets/svg_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../view/have_choice.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required File carImage,
    required String carName,
    required carNumber,
  }) : _carImage = carImage,
       _carName = carName,
       _carNumber = carNumber;

  final File _carImage;
  final String _carName;
  final String _carNumber;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => HaveChoice(
                      carImage: _carImage,
                      carName: _carName,
                      carNumber: _carNumber,
                    ),
              ),
            );
          },
          child: Row(
            children: [
              Text(
                _carName,
                style: TextStyle(
                  fontSize: height * 0.035,
                  fontFamily: 'noto_sans_medium',
                ),
              ),
              SvgPicture.asset(
                'assets/images/ModuleA/003/chevron_right.svg',
                height: height * 0.035,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.3,
          height: height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgIconButtonWidget(
                sgImage: 'assets/images/ModuleB/003/notifications.svg',
              ),
              SvgIconButtonWidget(
                sgImage: 'assets/images/ModuleB/003/settings.svg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
