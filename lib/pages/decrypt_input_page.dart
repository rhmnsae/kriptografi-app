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

class DecryptInputPage extends StatefulWidget {
  DecryptInputPage({super.key, required rsaBrain}) {
    _myRsaBrain = rsaBrain;
  }

  @override
  _DecryptInputPageState createState() => _DecryptInputPageState();
}

class _DecryptInputPageState extends State<DecryptInputPage> {
  TextEditingController secretMessageController = TextEditingController();

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
          kDecryptButtonTitle,
          style: kSimpleTextStyle,
        ),
        actions: [
          AppBarIconButton(
            padding: EdgeInsets.only(right: 7.w),
            icon: Icons.arrow_forward_ios,
            onPressed: () {
              if (secretMessageController.text.trim() == "") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      message: kSadSmiley,
                      title: kDecryptResultPageTitle,
                      alert: kDecryptResultAlertTitle,
                    ),
                  ),
                );
              } else {
                String? message = _myRsaBrain.decryptTheGetterMessage(
                    secretMessageController.text.trim());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (message != null)
                        ? ResultPage(
                            message: message,
                            title: kDecryptResultPageTitle,
                            alert: kDecryptResultAlertTitle,
                          )
                        : const ErrorPage(
                            title: kDecryptErrorTitle,
                            description: kDecryptErrorDescription,
                          ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: EditorScreenTemplate(
        controller: secretMessageController,
      ),
    );
  }
}
