import 'dart:async';
import 'package:drivemate/provider/home_icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// 아잇~ 씨팔 난 모르겠다~

class WarringButtonWidget extends StatefulWidget {
  const WarringButtonWidget({super.key});

  @override
  State<StatefulWidget> createState() => WarringButtonWidgetState();
}

class WarringButtonWidgetState extends State<WarringButtonWidget> {
  final String _svgImg = 'assets/images/ModuleB/003/warning.svg';
  final String _buttonText = '비상등';

  final Color _transparent = Colors.transparent;
  final Color _white = Colors.white;
  final Color _red = Colors.red;
  final Color _black = Colors.black;

  Timer? _timer;
  late Color warringColor;

  void _startBlink() {
    _timer?.cancel();
    warringColor = _white;
    Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        warringColor = warringColor == _white ? _red : _white;
      });
    });
  }

  void _stopBlink() {
    _timer?.cancel();
    setState(() {
      warringColor = _black;
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
    final width = size.width;
    final height = size.height;

    return Consumer<HomeIconProvider>(
      builder: (context, provider, _) {
        bool _isSelected = provider.warringState;

        return Column(
          children: [
            Container(
              width: width * 0.175,
              height: width * 0.175,

              decoration: BoxDecoration(
                border: Border.all(color: _black, width: 2),
                color: _isSelected ? _black : _transparent,
                borderRadius: BorderRadius.circular(height * 0.01),
              ),
              child: IconButton(
                splashColor: _transparent,
                highlightColor: _transparent,
                onPressed: () {
                  setState(() {
                    // provider.changeState('warring');
                    context.read<HomeIconProvider>().changeState('warring');
                  });
                },
                icon: SvgPicture.asset(
                  _svgImg,
                  colorFilter: ColorFilter.mode(warringColor, BlendMode.srcIn),
                  height: width * 0.175,
                ),
              ),
            ),

            SizedBox(
              width: width * 0.175,
              height: height * 0.035,
              child: Center(
                child: Text(
                  _buttonText,
                  style: TextStyle(
                    fontSize: height * 0.02,
                    fontFamily: 'noto_sans_medium',
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    // Column(
    //   children: [
    //     Container(
    //       width: width * 0.175,
    //       height: width * 0.175,
    //
    //       decoration: BoxDecoration(
    //         border: Border.all(color: _black, width: 2),
    //         // color: _isSelected ? _black : _transparent,
    //         borderRadius: BorderRadius.circular(height * 0.01),
    //       ),
    //       child: IconButton(
    //         splashColor: _transparent,
    //         highlightColor: _transparent,
    //         onPressed: () {
    //           setState(() {});
    //         },
    //         icon: SvgPicture.asset(
    //           _svgImg,
    //           colorFilter: ColorFilter.mode(_black, BlendMode.srcIn),
    //           height: width * 0.175,
    //         ),
    //       ),
    //     ),
    //
    //     SizedBox(
    //       width: width * 0.175,
    //       height: height * 0.035,
    //       child: Center(
    //         child: Text(
    //           _buttonText,
    //           style: TextStyle(
    //             fontSize: height * 0.02,
    //             fontFamily: 'noto_sans_medium',
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
