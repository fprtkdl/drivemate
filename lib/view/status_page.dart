import 'dart:io';
import 'package:flutter/material.dart';

import '../widgets/home_header_widget.dart';
import 'car_status_page.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({
    super.key,
    required File carImage,
    required String carName,
    required String carNumber,
    required bool doorState,
    required bool windowState,
  }) : _carImage = carImage,
       _carName = carName,
       _carNumber = carNumber,
       _doorState = doorState,
       _windowState = windowState;

  final File _carImage;
  final String _carName;
  final String _carNumber;
  final bool _doorState;
  final bool _windowState;
  @override
  State<StatusPage> createState() => StatusPageState();
}

class StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    labelStyle(Color color) => TextStyle(
      color: color,
      fontSize: height * 0.02,
      fontFamily: 'noto_sans_bold',
    );

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: SafeArea(
              child: HomeHeaderWidget(
                carImage: widget._carImage,
                carName: widget._carName,
                carNumber: widget._carNumber,
                centerText: 'Status',
              ),
            ),
          ),
          body: Column(
            children: [
              ColoredBox(
                color: Colors.white,
                child: TabBar(
                  tabs: const [Tab(text: '차량'), Tab(text: '공조')],
                  labelStyle: labelStyle(Color.fromRGBO(186, 136, 130, 1)),
                  unselectedLabelStyle: labelStyle(Colors.black),
                  indicatorColor: Color.fromRGBO(186, 136, 130, 1),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: height * 0.00275,
                  dividerColor: Colors.white,
                  overlayColor: WidgetStateColor.resolveWith(
                    (states) => Colors.transparent,
                  ),
                  splashFactory: NoSplash.splashFactory,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CarStatusPageWidget(
                      doorState: widget._doorState,
                      windowState: widget._windowState,
                    ),
                    ColoredBox(color: Colors.cyan),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
