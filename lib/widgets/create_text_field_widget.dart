import 'package:flutter/material.dart';

class CreateTextField extends StatefulWidget {
  const CreateTextField({
    super.key,
    required inputBoxWidth,
    required double iconHeight,
    required String inputHintText,
    required IconData inputIconData,
    Color? iconColor = Colors.black26,
    this.textEditingController,
    this.onPressedCustom,
  }) : _inputBoxWidth = inputBoxWidth,
       _iconHeight = iconHeight,
       _inputHintText = inputHintText,
       _inputIconData = inputIconData,
       _iconColor = iconColor;

  final double _inputBoxWidth;
  final double _iconHeight;
  final String _inputHintText;
  final IconData _inputIconData;
  final Color? _iconColor;
  final TextEditingController? textEditingController;
  final VoidCallback? onPressedCustom;

  @override
  State<StatefulWidget> createState() => CreateTextFieldState();
}

class CreateTextFieldState extends State<CreateTextField> {
  final _outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget._inputBoxWidth,
      child: TextField(
        controller: widget.textEditingController,
        onTapOutside: (e) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style: TextStyle(fontFamily: 'noto_sans_light'),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget._inputHintText,
          hintStyle: TextStyle(color: Colors.black45),
          border: _outlineBorder,
          focusedBorder: _outlineBorder,
          prefixIcon: Icon(
            widget._inputIconData,
            color: widget._iconColor,
            size: widget._iconHeight,
          ),
        ),
      ),
    );
  }
}
