import 'package:drivemate/widgets/main_logo.dart';
import 'package:flutter/material.dart';

import '../widgets/image_picker_widget.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<StatefulWidget> createState() => ChoicePageState();
}

class ChoicePageState extends State<ChoicePage> {
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
                child: Image.asset('assets/images/ModuleA/003/front-car.webp'),
              ),
              ImagePickerWidget(textButtonText: '차량 선택하기', eventCode: 0),
            ],
          ),
        ),
      ),
    );
  }
}
