import 'package:flutter/material.dart';
import 'package:kriptografi_app/utilities/constants.dart';
import 'package:sizer/sizer.dart';

class EditorScreenTemplate extends StatelessWidget {
  const EditorScreenTemplate({super.key, 
    required this.controller,
    this.maxLength,
  });

  final TextEditingController controller;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 7.0.w,
        left: 7.0.w,
        top: 3.0.h,
        bottom: 5.0.h,
      ),
      child: TextField(
        decoration: const InputDecoration(border: InputBorder.none),
        maxLength: maxLength,
        controller: controller,
        style: kSimpleTextStyle,
        cursorColor: Colors.white,
        textAlign: TextAlign.justify,
        autofocus: true,
        maxLines: null,
        autocorrect: false,
        expands: true,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
