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
    required this.textButtonText,
    this.buttonColorStart,
    this.buttonColorEnd,
    this.textColor,
  });

  final String textButtonText;
  final Color? buttonColorStart;
  final Color? buttonColorEnd;
  final Color? textColor;

  @override
  State<StatefulWidget> createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final textController = TextEditingController();
  final numController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    textController.dispose();
    numController.dispose();
    super.dispose();
  }

  Future<File?> _pickImage(ImageSource imageSource) async {
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
            widget.buttonColorStart ?? Color.fromRGBO(222, 3, 36, 1),
            widget.buttonColorEnd ?? Color.fromRGBO(172, 2, 28, 1),
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
            builder: (context) {
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.01,
                                  ),
                                  child: Text(
                                    '차량등록하기',
                                    style: TextStyle(
                                      fontFamily: 'noto_sans_bold',
                                      fontSize: height * 0.02,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/ModuleA/003/cancel.svg',
                                    width: height * 0.04,
                                    fit: BoxFit.fitWidth,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
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
                                      ),
                                      CreateTextField(
                                        inputBoxWidth: width * 0.85,
                                        iconHeight: height * 0.07,
                                        inputHintText: '차량 번호',
                                        inputIconData: Icons.pin_outlined,
                                        iconColor: Colors.black,
                                        textEditingController: numController,
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
                                                  ? SvgPicture.asset(
                                                    'assets/images/ModuleA/003/image.svg',
                                                    width: width * 0.15,
                                                  )
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
                                                        children: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              _pickImage(
                                                                ImageSource
                                                                    .gallery,
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
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              _pickImage(
                                                                ImageSource
                                                                    .camera,
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
          widget.textButtonText,
          style: TextStyle(
            color: widget.textColor ?? Colors.white,
            fontFamily: 'noto_sans_bold',
          ),
        ),
      ),
    );
  }
}
