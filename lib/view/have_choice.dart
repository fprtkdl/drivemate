import 'dart:io';

import 'package:drivemate/view/my_navigation_bar.dart';
import 'package:drivemate/widgets/image_picker_widget.dart';
import 'package:drivemate/widgets/main_logo.dart';
import 'package:drivemate/widgets/radial_gradient_button_widget.dart.dart';
import 'package:drivemate/widgets/switch_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/linear_gradient_button_widget.dart';

class HaveChoice extends StatefulWidget {
  const HaveChoice({
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
  State<StatefulWidget> createState() => HaveChoiceState();
}

class HaveChoiceState extends State<HaveChoice> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/ModuleA/003/cloud1.png'),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              MainLogo(),
              SizedBox(height: height * 0.16),
              SizedBox(
                height: height * 0.3,
                child: Image.file(widget._carImage),
              ),
              Text(
                widget._carName,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'noto_sans_bold',
                  fontSize: height * 0.03,
                ),
              ),
              SwitchWidget(),
              LinearGradientButtonWidget(
                gradientButtonText: '이 차량 선택하기',
                onPressedCustom:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MyNavigationBar(
                              carImage: widget._carImage,
                              carName: widget._carName,
                              carNumber: widget._carNumber,
                            ),
                      ),
                    ),
              ),
              SizedBox(height: height * 0.025),
              ImagePickerWidget(
                textButtonText: '차량 등록하기',
                buttonColorStart: Color.fromRGBO(55, 55, 55, 1.0),
                buttonColorEnd: Color.fromRGBO(55, 55, 55, 1.0),
                textColor: Color.fromRGBO(186, 136, 130, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
