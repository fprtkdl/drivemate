import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key, required tabTitle, required tabIconData})
    : _tabTitle = tabTitle,
      _tabIconData = tabIconData;

  final String _tabTitle;
  final IconData _tabIconData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return Tab(
      height: height * 0.08,
      child: Column(
        children: [
          Icon(_tabIconData, size: height * 0.05),
          Text(_tabTitle, style: TextStyle(fontFamily: 'noto_sans_bold')),
        ],
      ),
    );
  }
}
