import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarStatusPageWidget extends StatefulWidget {
  const CarStatusPageWidget({
    super.key,
    required bool doorState,
    required bool windowState,
  }) : _doorState = doorState,
       _windowState = windowState;

  final bool _doorState;
  final bool _windowState;
  @override
  State<StatefulWidget> createState() => CarStatusPageWidgetState();
}

class CarStatusPageWidgetState extends State<CarStatusPageWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.075,
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              '차량상태',
              style: TextStyle(
                fontSize: height * 0.02,
                fontFamily: 'noto_sans_bold',
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.075),
                  child: SizedBox(
                    height: height * 0.08,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: width * 0.04,
                            children: [
                              SvgPicture.asset(
                                'assets/images/ModuleB/003/door2.svg',
                                height: height * 0.04,
                                colorFilter: ColorFilter.mode(
                                  widget._doorState
                                      ? Color.fromRGBO(186, 136, 130, 1)
                                      : Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Text(
                                '도어',
                                style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontFamily: 'noto_sans_bold',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget._doorState ? '열림' : '닫힘',
                            style: TextStyle(
                              color:
                                  widget._doorState
                                      ? Color.fromRGBO(186, 136, 130, 1)
                                      : Colors.black54,
                              fontSize: height * 0.02,
                              fontFamily: 'noto_sans_bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
