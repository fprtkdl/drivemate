import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/home_header_widget.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({
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
  State<StatefulWidget> createState() => StatusPageState();
}

class StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: HomeHeaderWidget(
                carImage: widget._carImage,
                carName: widget._carName,
                carNumber: widget._carNumber,
                centerText: 'Status',
              ),
            ),
            bottom: TabBar(
              tabs: [Tab(text: 'qwer'), Tab(text: 'qwer')],
              labelStyle: TextStyle(color: Color.fromRGBO(186, 136, 130, 1)),
            ),
          ),
          body: TabBarView(
            children: [
              ColoredBox(color: Colors.green),
              ColoredBox(color: Colors.cyan),
            ],
          ),
        ),
      ),
    );
  }
}
