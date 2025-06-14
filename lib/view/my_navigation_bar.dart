import 'dart:io';

import 'package:drivemate/view/status_page.dart';
import 'package:drivemate/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({
    super.key,
    required carImage,
    required carName,
    required carNumber,
  }) : _carImage = carImage,
       _carName = carName,
       _carNumber = carNumber;

  final File _carImage;
  final String _carName;
  final String _carNumber;

  @override
  State<StatefulWidget> createState() => MyNavigationBarState();
}

class MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    bool doorState = false;
    bool windowState = false;

    changeDoorState() {
      setState(() {
        doorState = !doorState;
      });
    }

    changeWindowState() {
      setState(() {
        windowState = !windowState;
      });
    }

    final List<Widget> tabViewList = [
      HomePageWidget(
        carImage: widget._carImage,
        carName: widget._carName,
        carNumber: widget._carNumber,
        changeDoorState: changeDoorState,
        changeWindowState: changeWindowState,
      ),
      const ColoredBox(color: Colors.blue),
      StatusPage(
        carImage: widget._carImage,
        carName: widget._carName,
        carNumber: widget._carNumber,
        doorState: doorState,
        windowState: windowState,
      ),
      const ColoredBox(color: Colors.yellow),
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabViewList.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            TabWidget(tabTitle: 'Home', tabIconData: Icons.home_outlined),
            TabWidget(
              tabTitle: 'Control',
              tabIconData: Icons.control_camera_outlined,
            ),
            TabWidget(
              tabTitle: 'Status',
              tabIconData: Icons.directions_car_outlined,
            ),
            TabWidget(tabTitle: 'Share', tabIconData: Icons.device_hub),
          ],
        ),
        body: TabBarView(children: tabViewList),
      ),
    );
  }
}
