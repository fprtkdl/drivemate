import 'package:drivemate/widgets/status_page_hvac_child.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_icon_provider.dart';

class HVACPage extends StatefulWidget {
  const HVACPage({super.key});

  @override
  State<StatefulWidget> createState() => HVACPageState();
}

class HVACPageState extends State<HVACPage> {
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
              '공조 상태',
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
                    StatusPageHVACChildWidget(
                      svgImage: 'assets/images/ModuleB/003/mode_cool.svg',
                      barBtnText: '냉/난방',
                      state: provider.doorState,
                      useHeat: false,
                    ),
                    StatusPageHVACChildWidget(
                      svgImage: 'assets/images/ModuleB/003/handle.svg',
                      barBtnText: '핸들 열선',
                      state: provider.windowState,
                      heatTop: 0.0225,
                    ),
                    StatusPageHVACChildWidget(
                      svgImage: 'assets/images/ModuleB/003/mirror.svg',
                      barBtnText: '앞유리 성에 제거',
                      state: provider.powerState,
                      angle: 0.5,
                    ),
                    StatusPageHVACChildWidget(
                      svgImage: 'assets/images/ModuleB/003/mirror.svg',
                      barBtnText: '뒷유리 열선',
                      state: provider.powerState,
                      angle: 0.5,
                      heatTop: 0.04,
                    ),
                    StatusPageHVACChildWidget(
                      svgImage: 'assets/images/ModuleB/003/side_mirror.svg',
                      barBtnText: '사이드 미러 열선',
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
