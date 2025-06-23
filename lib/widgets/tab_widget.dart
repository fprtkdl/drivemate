import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.tabTitle,
    required this.tabIconData,
  });

  final String tabTitle;
  final IconData tabIconData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return Tab(
      height: height * 0.08,
      child: Column(
        children: [
          Icon(tabIconData, size: height * 0.05),
          Text(tabTitle, style: TextStyle(fontFamily: 'noto_sans_bold')),
        ],
      ),
    );
  }
}
