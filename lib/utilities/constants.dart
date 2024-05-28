import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const kMainColor = Color(0xFF1D252C);
const kSecondaryColor = Color(0xFF3E444A);
const kErrorColor = Color(0xFFC55C5C);
const kEncryptButtonForeground = Color(0xFFEBEBEB);
const kEncryptButtonBackground = Color(0xFF858585);
const kDecryptButtonForeground = Color(0xFF1D252C);
const kDecryptButtonBackground = Color(0xFFCCCCCC);

const kPublicKeyTitle = 'Kunci Publik Anda';
const kPublicKeyInputPageTitle = 'Kunci Publik Penerima';
const kMessageInputPageTitle = 'Pesan';
const kErrorPageTitle = 'Error';
const kPublicKeyAlertTitle = 'Public Key is Copied!';
const kEncryptButtonTitle = 'Enkripsi';
const kDecryptButtonTitle = 'Dekripsi';
const kEncryptErrorTitle = 'Kunci Publik Tidak Valid';
const kEncryptErrorDescription =
    "Silakan Masukkan Kunci Publik Penerima Saat Ini.";
const kDecryptErrorTitle = "Itu Bukan Pesan Anda";
const kDecryptErrorDescription =
    'Silakan Berikan Kunci Publik Anda Saat Ini Kepada Pengirimnya.';
const kEncryptResultPageTitle = 'Hasil Enkripsi';
const kEncryptResultAlertTitle = 'Hasil Enkripsi Disalin!';
const kDecryptResultPageTitle = 'Hasil Dekripsi';
const kDecryptResultAlertTitle = 'Hasil Dekripsi Disalin!';
const kSadSmiley = ':(';
const kMaxTextFieldLength = 245;

final kBigTextStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
);

final kPublicKeyDataTextStyle = TextStyle(
  fontSize: 18.sp,
  color: kEncryptButtonBackground,
);

final kSimpleTextStyle = TextStyle(
  fontSize: 18.sp,
);

final kSnackBarTextStyle = TextStyle(
  fontSize: 11.0.sp,
  color: kEncryptButtonForeground,
);
