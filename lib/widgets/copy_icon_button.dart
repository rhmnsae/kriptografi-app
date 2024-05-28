import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kriptografi_app/utilities/constants.dart';

class CopyIconButton extends StatelessWidget {
  const CopyIconButton({super.key, 
    required this.clipboardDataText,
    required this.alertText,
    required this.iconSize,
  });

  final String clipboardDataText;
  final String alertText;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: iconSize,
        onPressed: () {
          Clipboard.setData(ClipboardData(text: clipboardDataText)).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  alertText,
                  textAlign: TextAlign.center,
                  style: kSnackBarTextStyle,
                ),
                backgroundColor: Colors.transparent,
              ),
            );
          });
        },
        icon: const Icon(Icons.copy));
  }
}
