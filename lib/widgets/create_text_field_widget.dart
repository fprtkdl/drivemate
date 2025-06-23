import 'package:flutter/material.dart';

class CreateTextField extends StatefulWidget {
  const CreateTextField({
    super.key,
    required this.inputBoxWidth,
    required this.iconHeight,
    required this.inputHintText,
    required this.inputIconData,
    this.textEditingController,
    this.focusNode,
    this.nextFocus,
    this.iconColor = Colors.black26,
  });

  final double inputBoxWidth;
  final double iconHeight;
  final String inputHintText;
  final IconData inputIconData;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final void Function(String)? nextFocus;
  final Color? iconColor;

  @override
  State<CreateTextField> createState() => CreateTextFieldState();
}

class CreateTextFieldState extends State<CreateTextField> {
  static final _outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.inputBoxWidth,
      child: TextField(
        controller: widget.textEditingController,
        focusNode: widget.focusNode,
        obscureText: widget.inputHintText == 'Password',
        style: const TextStyle(fontFamily: 'noto_sans_light'),
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        onSubmitted: widget.nextFocus,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.inputHintText,
          hintStyle: const TextStyle(color: Colors.black45),
          border: _outlineBorder,
          focusedBorder: _outlineBorder,
          prefixIcon: Icon(
            widget.inputIconData,
            color: widget.iconColor,
            size: widget.iconHeight,
          ),
        ),
      ),
    );
  }
}
