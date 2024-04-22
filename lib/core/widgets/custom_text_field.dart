import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.passwordIsVisable = false,
    this.validate,
    this.icon,
    this.icon2,
    this.pill,
    this.suffixIconOnPressed,
  });

  final TextEditingController controller;
  final String? hint;
  final String? label;

  final Widget? pill;
  final IconData? icon;
  final IconData? icon2;
  final VoidCallback? suffixIconOnPressed;
  final bool passwordIsVisable;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      validator: validate,
      obscureText: passwordIsVisable,
      decoration: InputDecoration(
        //suffix: Image.asset( AppAssets.pills,width: 25,height: 25,),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary, // Set the color of the border
            width: 2.0, // Set the width of the border
          ),
        ),
        hintText: hint,
        labelText: label,
        icon: pill,
        prefixIcon: Icon(
          icon2,
          color: AppColors.primary,
        ),
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(icon),
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class CustomTextFormField2 extends StatelessWidget {
  const CustomTextFormField2({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.passwordIsVisable = false,
    this.validate,
    this.icon,
    this.icon2,
    this.pill,
    this.suffixIconOnPressed,
    this.onChange,
  });

  final TextEditingController controller;
  final String? hint;
  final String? label;

  final Widget? pill;
  final IconData? icon;
  final IconData? icon2;
  final VoidCallback? suffixIconOnPressed;
  final bool passwordIsVisable;
  final String? Function(String?)? validate;
  final String? Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primary,
        validator: validate,
        obscureText: passwordIsVisable,
        onChanged: onChange,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.primaryLight,
          //suffix: Image.asset( AppAssets.pills,width: 25,height: 25,),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary, // Set the color of the border
              width: 2.0, // Set the width of the border
            ),
          ),
          hintText: hint,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          icon: pill,
          prefixIcon: Icon(
            icon2,
            color: AppColors.black,
          ),
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(icon),
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
