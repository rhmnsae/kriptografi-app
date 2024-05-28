// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kriptografi_app/pages/decrypt_input_page.dart';
import 'package:kriptografi_app/pages/public_key_input_page.dart';
import 'package:kriptografi_app/utilities/rsa_brain.dart';
import 'package:sizer/sizer.dart';
import 'package:kriptografi_app/utilities/constants.dart';
import 'package:kriptografi_app/widgets/copy_icon_button.dart';
import 'package:kriptografi_app/widgets/navigation_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final RSABrain _myRsaBrain = RSABrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 7.0.w,
            left: 7.0.w,
            top: 4.0.h,
            bottom: 5.0.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 3.0.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        kPublicKeyTitle,
                        style: kBigTextStyle,
                      ),
                    ),
                    CopyIconButton(
                      clipboardDataText:
                          _myRsaBrain.getOwnPublicKey().toString(),
                      alertText: kPublicKeyAlertTitle,
                      iconSize: 23.5.sp,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    _myRsaBrain.getOwnPublicKey().toString(),
                    textAlign: TextAlign.justify,
                    style: kPublicKeyDataTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0.h),
                child: Column(
                  children: [
                    NavigationButton(
                      foreground: kEncryptButtonForeground,
                      background: kEncryptButtonBackground,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PublicKeyInputPage(
                              rsaBrain: _myRsaBrain,
                            ),
                          ),
                        );
                      },
                      text: kEncryptButtonTitle,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    NavigationButton(
                      foreground: kDecryptButtonForeground,
                      background: kDecryptButtonBackground,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DecryptInputPage(
                              rsaBrain: _myRsaBrain,
                            ),
                          ),
                        );
                      },
                      text: kDecryptButtonTitle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
