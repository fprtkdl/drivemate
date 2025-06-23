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
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FocusNode passNode = FocusNode();

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: PopScope(
            canPop: false,
            child: Container(
              width: width,
              height: height,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                  MainLogo(),
                  SizedBox(
                    height: height * 0.3,
                    child: const Image(
                      image: AssetImage(
                        'assets/images/ModuleA/003/red car.png',
                      ),
                    ),
                  ),
                  Text(
                    '로그인 정보를 입력하세요.',
                    style: const TextStyle(
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
                          textEditingController: userController,
                          nextFocus:
                              (_) =>
                                  FocusScope.of(context).requestFocus(passNode),
                        ),
                        CreateTextField(
                          inputBoxWidth: width * 0.9,
                          iconHeight: height * 0.04,
                          inputHintText: 'Password',
                          inputIconData: Icons.lock,
                          textEditingController: passController,
                          focusNode: passNode,
                        ),
                      ],
                    ),
                  ),
                  SwitchWidget(),
                  LinearGradientButtonWidget(
                    gradientButtonText: 'Sign In',
                    onPressedCustom: () {
                      String userText =
                          userController.text.trim(); // UsernameTextField
                      String passText =
                          passController.text.trim(); // PasswordTextField
                      if (userText.isNotEmpty &&
                          userText.length >= 4 &&
                          passText.isNotEmpty &&
                          passText.length >= 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChoicePage()),
                        );
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  SingleColorWidget(
                    simpleButtonText: 'Sign Up',
                    simpleButtonColor: Color.fromRGBO(126, 126, 126, 1.0),
                    simpleButtonTextColor: Colors.white,
                  ),
                  SizedBox(height: height * 0.02),
                  SingleColorWidget(
                    simpleButtonText: 'Password Reset',
                    simpleButtonColor: Colors.white,
                    simpleButtonTextColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
