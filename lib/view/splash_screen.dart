import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return Material(
      child: Container(
        height: height,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: height * 0.15),
            SizedBox(
              height: height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/ModuleA/003/splash_img.svg',
                    width: height * 0.13,
                    height: height * 0.13,
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
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '연결하고, 운전하고, 즐기세요',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.02,
                      fontFamily: 'noto_sans_medium',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            const Image(image: AssetImage('assets/images/ModuleA/003/car.png')),
          ],
        ),
      ),
    );
  }
}
