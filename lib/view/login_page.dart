import 'package:drivemate/widgets/create_text_field_widget.dart';
import 'package:drivemate/widgets/main_logo.dart';
import 'package:drivemate/widgets/linear_gradient_button_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/single_color_widget.dart';
import '../widgets/switch_widget.dart';
import 'choice_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            MainLogo(),
            SizedBox(
              height: height*0.3,
              child: Image(image: AssetImage('assets/images/ModuleA/003/red car.png')),
            ),
            Text(
              '로그인 정보를 입력하세요.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'noto_sans_medium',
              ),
            ),
            SizedBox(height: height * 0.015),
            SizedBox(
              width: width,
              height: height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreateTextField(
                    inputBoxWidth: width * 0.9,
                    iconHeight: height * 0.04,
                    inputHintText: 'Username',
                    inputIconData: Icons.person,
                  ),
                  CreateTextField(
                    inputBoxWidth: width * 0.9,
                    iconHeight: height * 0.04,
                    inputHintText: 'Password',
                    inputIconData: Icons.lock,
                  ),
                ],
              ),
            ),
            SwitchWidget(),
            LinearGradientButtonWidget(
              gradientButtonText: 'Sign In',
              onPressedCustom:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoicePage()),
                  ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleColorWidget(
                    simpleButtonText: 'Sign Up',
                    simpleButtonColor: Color.fromRGBO(126, 126, 126, 1.0),
                    simpleButtonTextColor: Colors.white,
                  ),
                  SizedBox(height: height * 0.015),
                  SingleColorWidget(
                    simpleButtonText: 'Password Reset',
                    simpleButtonColor: Colors.white,
                    simpleButtonTextColor: Colors.black,
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
