import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<StatefulWidget> createState() => SwitchWidgetState();
}

class SwitchWidgetState extends State<SwitchWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    return SizedBox(
      width: width * 0.9,
      height: height * 0.08,
      child: Row(
        children: [
          Switch(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          Text(
            'Remember',
            style: TextStyle(color: Colors.white, fontSize: height * 0.02),
          ),
        ],
      ),
    );
  }
}
