// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kriptografi_app/utilities/constants.dart';
import 'package:kriptografi_app/pages/result_page.dart';
import 'package:kriptografi_app/pages/error_page.dart';
import 'package:kriptografi_app/utilities/rsa_brain.dart';
import 'package:kriptografi_app/widgets/appbar_icon_button.dart';
import 'package:kriptografi_app/widgets/editor_screen_template.dart';
import 'package:sizer/sizer.dart';

late RSABrain _myRsaBrain;

class MessageInputPage extends StatefulWidget {
  MessageInputPage({super.key, required rsaBrain}) {
    _myRsaBrain = rsaBrain;
  }

  @override
  _MessageInputPageState createState() => _MessageInputPageState();
}

class _MessageInputPageState extends State<MessageInputPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: AppBarIconButton(
          padding: EdgeInsets.only(left: 7.w),
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          kMessageInputPageTitle,
          style: kSimpleTextStyle,
        ),
        actions: [
          AppBarIconButton(
            padding: EdgeInsets.only(right: 7.w),
            icon: Icons.arrow_forward_ios,
            onPressed: () {
              String? secretMessage = _myRsaBrain.encryptTheSetterMessage(
                  (messageController.text.trim().length > kMaxTextFieldLength)
                      ? messageController.text
                          .trim()
                          .substring(0, kMaxTextFieldLength)
                      : messageController.text.trim());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (secretMessage != null)
                      ? ResultPage(
                          message: secretMessage,
                          title: kEncryptResultPageTitle,
                          alert: kEncryptResultAlertTitle,
                        )
                      : const ErrorPage(
                          title: kEncryptErrorTitle,
                          description: kEncryptErrorDescription,
                        ),
                ),
              );
            },
          ),
        ],
      ),
      body: EditorScreenTemplate(
        controller: messageController,
        maxLength: kMaxTextFieldLength,
      ),
    );
  }
}
