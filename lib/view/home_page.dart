import 'dart:async';
import 'dart:io';
import 'package:drivemate/provider/home_icon_provider.dart';
import 'package:drivemate/widgets/file_image_frame_widget.dart';
import 'package:drivemate/widgets/home_page_icon_text_button.dart';
import 'package:drivemate/widgets/sub_state.dart';
import 'package:drivemate/widgets/home_page_scroll_list_btn.dart';
import 'package:drivemate/widgets/warring_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_header_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    required File carImage,
    required String carName,
    required String carNumber,
  }) : _carImage = carImage,
       _carName = carName,
       _carNumber = carNumber;

  final File _carImage;
  final String _carName;
  final String _carNumber;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  String lockImg = 'assets/images/ModuleB/003/lock.svg';
  Timer? _refreshTimer;

  bool onRefreshState = true;

  void returnOnRefreshState() {
    if (onRefreshState) {
      setState(() {
        onRefreshState = false;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          onRefreshState = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    bool notificationPredicate(ScrollNotification notification) {
      return onRefreshState;
    }

    return SafeArea(
      child: RefreshIndicator(
        notificationPredicate: notificationPredicate,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 800));
          setState(() {
            returnOnRefreshState();
          });
        },
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.475, 0.55],
                        colors: [
                          Color.fromRGBO(169, 169, 169, 1.0),
                          Color.fromRGBO(255, 255, 255, 1.0),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        HomeHeaderWidget(
                          carImage: widget._carImage,
                          carName: widget._carName,
                          carNumber: widget._carNumber,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubState(
                                  subIcon:
                                      'assets/images/ModuleB/003/weather/sunny_weather.svg',
                                  subText: '28.1℃',
                                ),
                                SubState(
                                  subIcon:
                                      'assets/images/ModuleB/003/my_location.svg',
                                  subText: '경상북도 경주시',
                                ),
                              ],
                            ),
                            SubState(
                              subIcon:
                                  'assets/images/ModuleB/003/local_gas.svg',
                              subText: '424km',
                            ),
                          ],
                        ),
                        FileTypeImageFrameWidget(
                          fileTypeImage: widget._carImage,
                          imageHeight: height * 0.2,
                          topGap: height * 0.045,
                          bottomGap: height * 0.045,
                        ),
                        SizedBox(
                          width: width * 0.85,
                          child: Consumer<HomeIconProvider>(
                            builder: (context, provider, _) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HomePageIconTextButton(
                                    svgImg:
                                        'assets/images/ModuleB/003/power_settings.svg',
                                    buttonText: '시동',
                                    isSelected: provider.powerState,
                                    changed:
                                        () => provider.changeState('power'),
                                  ),
                                  HomePageIconTextButton(
                                    svgImg:
                                        'assets/images/ModuleB/003/lock.svg',
                                    selectedImg:
                                        'assets/images/ModuleB/003/lock_open.svg',
                                    buttonText: '도어',
                                    isSelected: provider.doorState,
                                    changed: () => provider.changeState('door'),
                                  ),
                                  HomePageIconTextButton(
                                    svgImg:
                                        'assets/images/ModuleB/003/car-door.svg',
                                    buttonText: '창문',
                                    isSelected: provider.windowState,
                                    changed:
                                        () => provider.changeState('window'),
                                  ),
                                  WarringButtonWidget(),
                                ],
                              );
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: width, height: height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.05,
                              ),
                              child: Text(
                                '이정규님, 안녕하세요?',
                                style: TextStyle(
                                  fontFamily: 'noto_sans_bold',
                                  fontSize: height * 0.02,
                                ),
                              ),
                            ),
                            SizedBox(width: width, height: height * 0.01),
                          ],
                        ),
                        Container(
                          width: width * 0.85,
                          height: height * 0.225,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.015),
                                HomePageScrollListBtn(
                                  svgImage:
                                      'assets/images/ModuleB/003/car-svgrepo.svg',
                                  menuText: 'Vehicle control',
                                ),
                                HomePageScrollListBtn(
                                  svgImage:
                                      'assets/images/ModuleB/003/car-svgrepo.svg',
                                  menuText: 'Vehicle control',
                                ),
                                HomePageScrollListBtn(
                                  svgImage:
                                      'assets/images/ModuleB/003/car-svgrepo.svg',
                                  menuText: 'Vehicle control',
                                ),
                                HomePageScrollListBtn(
                                  svgImage:
                                      'assets/images/ModuleB/003/car-svgrepo.svg',
                                  menuText: 'Vehicle control',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
