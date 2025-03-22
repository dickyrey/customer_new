import 'package:flutter/material.dart';
import 'package:shared_common/colors.dart';
import 'package:shared_libraries/fluttertoast/fluttertoast.dart';

Future<dynamic> showToast({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
  ToastGravity gravity = ToastGravity.CENTER,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: gravity,
    backgroundColor: backgroundColor ?? ColorLight.primary,
    textColor: textColor ?? Colors.white,
  );
}
