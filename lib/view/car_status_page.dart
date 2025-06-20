import 'package:drivemate/widgets/status_page_car_child.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/home_icon_provider.dart';

class CarStatusPageWidget extends StatefulWidget {
  const CarStatusPageWidget({super.key});

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
            child: Consumer<HomeIconProvider>(
              builder: (context, provider, _) {
                return Column(
                  children: [
                    StatusPageCarChildWidget(
                      svgImage: 'assets/images/ModuleB/003/door2.svg',
                      barBtnText: '도어',
                      state: provider.doorState,
                    ),
                    StatusPageCarChildWidget(
                      svgImage: 'assets/images/ModuleB/003/window.svg',
                      barBtnText: '창문',
                      state: provider.windowState,
                    ),
                    StatusPageCarChildWidget(
                      svgImage: 'assets/images/ModuleB/003/tailgate.svg',
                      barBtnText: '테일게이트',
                      state: provider.powerState,
                    ),
                    StatusPageCarChildWidget(
                      svgImage: 'assets/images/ModuleB/003/bonnet.svg',
                      barBtnText: '후드',
                      state: provider.powerState,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
