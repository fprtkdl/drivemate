import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusPageHVACChildWidget extends StatefulWidget {
  const StatusPageHVACChildWidget({
    super.key,
    required this.svgImage,
    required this.barBtnText,
    this.state = false,
    this.angle = 2,
    this.useHeat = true,
    this.heatTop = 0.025,
  });

  final String svgImage;
  final String barBtnText;
  final bool state;
  final double angle;
  final bool useHeat;
  final double heatTop;

  @override
  State<StatefulWidget> createState() => StatusPageHVACChildWidgetState();
}

class StatusPageHVACChildWidgetState extends State<StatusPageHVACChildWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    final selectedColor = const Color.fromRGBO(186, 136, 130, 1);
    final textColor = widget.state ? selectedColor : Colors.black;
    final iconColor = widget.state ? selectedColor : Colors.black54;
    final heatColor = widget.state ? Colors.red : Colors.black;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.075),
      child: SizedBox(
        height: height * 0.08,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: height * 0.08,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        widget.useHeat ? Positioned(
                          top: height * widget.heatTop,
                          child: SvgPicture.asset(
                            'assets/images/ModuleB/003/heat.svg',
                            height: height * 0.015,
                            colorFilter: ColorFilter.mode(
                              heatColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ) : SizedBox(),
                        Transform.rotate(
                          angle: pi * widget.angle,
                          child: SvgPicture.asset(
                            widget.svgImage,
                            height: height * 0.025,
                            colorFilter: ColorFilter.mode(
                              textColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    widget.barBtnText,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontFamily: 'noto_sans_bold',
                    ),
                  ),
                ],
              ),
              Text(
                widget.state ? '켜짐' : '꺼짐',
                style: TextStyle(
                  color: iconColor,
                  fontSize: height * 0.02,
                  fontFamily: 'noto_sans_bold',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
