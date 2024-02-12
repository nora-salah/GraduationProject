import 'package:flutter/material.dart';

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
