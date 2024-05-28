import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kriptografi_app/pages/home_page.dart';
import 'package:sizer/sizer.dart';
import 'utilities/constants.dart';

void main() => runApp(const RSAEncrypter());

class RSAEncrypter extends StatelessWidget {
  const RSAEncrypter({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kMainColor,
    ));
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kMainColor,
          scaffoldBackgroundColor: kMainColor,
          platform: TargetPlatform.iOS,
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent),
            ),
          ),
        ),
        home: const HomePage(),
      );
    });
  }
}
