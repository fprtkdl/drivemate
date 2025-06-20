import 'dart:io';

import 'package:drivemate/view/have_choice.dart';
import 'package:drivemate/widgets/create_text_field_widget.dart';
import 'package:drivemate/widgets/linear_gradient_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    required String textButtonText,
    Color? buttonColorStart,
    Color? buttonColorEnd,
    Color? textColor,
  }) : _textButtonText = textButtonText,
       _buttonColorStart = buttonColorStart,
       _buttonColorEnd = buttonColorEnd,
       _textColor = textColor;

  final String _textButtonText;
  final Color? _buttonColorStart;
  final Color? _buttonColorEnd;
  final Color? _textColor;

  @override
  State<StatefulWidget> createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  late String carName;
  late String carNumber;

  final textController = TextEditingController();
  final numController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    numController.dispose();
    super.dispose();
  }

  final ImagePicker picker = ImagePicker();

  SvgPicture imagePickerImage = SvgPicture.asset(
    'assets/images/ModuleA/003/image.svg',
  );

  Future<File?> _pickImage(ImageSource imageSource, void pop) async {
    final pickFile = await picker.pickImage(source: imageSource);
    if (pickFile != null) {
      return File(pickFile.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Container(
      width: width * 0.9,
      height: height * 0.07,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            widget._buttonColorStart ?? Color.fromRGBO(222, 3, 36, 1),
            widget._buttonColorEnd ?? Color.fromRGBO(172, 2, 28, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            constraints: BoxConstraints(minWidth: width),
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    width: width,
                    height: height * 0.7,
                    color: Color.fromRGBO(229, 229, 229, 1),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.95,
                            height: height * 0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.01,
                                  ),
                                  child: Text(
                                    '차량등록하기',
                                    style: TextStyle(
                                      fontFamily: 'noto_sans_bold',
                                      fontSize: height * 0.02,
                                      color: widget._textColor ?? Colors.white,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/ModuleA/003/cancel.svg',
                                    width: height * 0.04,
                                    fit: BoxFit.fitWidth,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    overlayColor: WidgetStateColor.resolveWith(
                                      (states) => Colors.transparent,
                                    ),
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height * 0.45,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CreateTextField(
                                        inputBoxWidth: width * 0.85,
                                        iconHeight: height * 0.07,
                                        inputHintText: '차량 이름',
                                        inputIconData:
                                            Icons.directions_car_outlined,
                                        iconColor: Colors.black,
                                        textEditingController: textController,
                                        onPressedCustom:
                                            () => carName = textController.text,
                                      ),
                                      CreateTextField(
                                        inputBoxWidth: width * 0.85,
                                        iconHeight: height * 0.07,
                                        inputHintText: '차량 번호',
                                        inputIconData: Icons.pin_outlined,
                                        iconColor: Colors.black,
                                        textEditingController: numController,
                                        onPressedCustom:
                                            () =>
                                                carNumber = numController.text,
                                      ),
                                      Container(
                                        width: width * 0.85,
                                        height: height * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: Colors.black12,
                                        ),
                                        child: MaterialButton(
                                          child:
                                              _image == null
                                                  ? Text('')
                                                  : Image.file(_image!),
                                          onPressed:
                                              () => showDialog(
                                                context: context,
                                                builder:
                                                    (
                                                      BuildContext context,
                                                    ) => AlertDialog(
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextButton(
                                                            onPressed: () {
                                                              _pickImage(
                                                                ImageSource
                                                                    .gallery,
                                                                Navigator.pop(
                                                                  context,
                                                                ),
                                                              ).then((file) {
                                                                setState(() {
                                                                  _image = file;
                                                                });
                                                              });
                                                            },
                                                            child: Text('갤러리'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              _pickImage(
                                                                ImageSource
                                                                    .camera,
                                                                Navigator.pop(
                                                                  context,
                                                                ),
                                                              ).then((file) {
                                                                setState(() {
                                                                  _image = file;
                                                                });
                                                              });
                                                            },
                                                            child: Text('카메라'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('이미지를 선택 해 주세요.'),
                                Text('갤러리 앱 또는 카메라를 이용하실 수 있습니다.'),
                                if (_image == null ||
                                    textController.text.isEmpty ||
                                    numController.text.isEmpty)
                                  LinearGradientButtonWidget(
                                    gradientButtonText: '차량 등록 후 이용하기',
                                  )
                                else
                                  LinearGradientButtonWidget(
                                    gradientButtonText: '차량 등록 후 이용하기',
                                    onPressedCustom:
                                        () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => HaveChoice(
                                                  carImage: _image!,
                                                  carName: textController.text,
                                                  carNumber: numController.text,
                                                ),
                                          ),
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ).whenComplete(() {
            setState(() {
              _image = null;
              textController.clear();
              numController.clear();
            });
          });
        },
        child: Text(
          widget._textButtonText,
          style: TextStyle(color: Colors.white, fontFamily: 'noto_sans_bold'),
        ),
      ),
    );
  }
}
