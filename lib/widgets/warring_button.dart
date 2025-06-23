import 'dart:async';
import 'package:drivemate/provider/home_icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WarringButtonWidget extends StatefulWidget {
  const WarringButtonWidget({super.key});

  @override
  State<WarringButtonWidget> createState() => _WarringButtonWidgetState();
}

class _WarringButtonWidgetState extends State<WarringButtonWidget> {
  static const _svgImg = 'assets/images/ModuleB/003/warning.svg';
  static const _buttonText = '비상등';
  static const _transparent = Colors.transparent;
  static const _white = Colors.white;
  static const _red = Colors.red;
  static const _black = Colors.black;

  Timer? _timer;
  Color _warringColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _warringColor = _black;
  }

  void _startBlink() {
    _timer?.cancel();
    if (_warringColor != _white) {
      setState(() {
        _warringColor = _white;
      });
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      // mounted 은 연결 유무를 알 수 있다, 얘가 false 면 죽음, true 면 생존, 죽은 사람 불러봤자 의미없는 것 처럼 프밍 에서도 !mounted 상태에서 위젯 호출하면 오류난다.
      setState(() {
        _warringColor = _warringColor == _white ? _red : _white;
      });
    });
  }

  void _stopBlink() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _warringColor = _black;
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
        bool isSelected = provider.warringState;

        // 깜빡임 제어
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (isSelected && _timer == null) {
            _startBlink();
          } else if (!isSelected && _timer != null) {
            _stopBlink();
          }
        });

        return Column(
          children: [
            Container(
              width: width * 0.175,
              height: width * 0.175,
              decoration: BoxDecoration(
                border: Border.all(color: _black, width: 2),
                color: isSelected ? _black : _transparent,
                borderRadius: BorderRadius.circular(height * 0.01),
              ),
              child: IconButton(
                splashColor: _transparent,
                highlightColor: _transparent,
                onPressed: () {
                  provider.changeState('warring');
                },
                icon: SvgPicture.asset(
                  _svgImg,
                  colorFilter: ColorFilter.mode(_warringColor, BlendMode.srcIn),
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
  }
}
