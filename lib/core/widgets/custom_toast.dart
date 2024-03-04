
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pill_detection/core/utils/app_colors.dart';

void showTwist({required String messege,required ToastStates state}){
  Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: AppColors.white,
      fontSize: 16.0
  );
}
enum ToastStates{error,success,warning,}

Color getState(ToastStates  state) {
  switch (state) {
    case ToastStates.error:return AppColors.red;
    case ToastStates.success:return AppColors.primary;
    case ToastStates.warning:return AppColors.yellow;
  }
}
