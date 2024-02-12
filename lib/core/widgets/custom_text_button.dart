import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: AppColors.primary,decoration: TextDecoration.underline,fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CustomTextButton2 extends StatelessWidget {
  const CustomTextButton2({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: AppColors.primary,decoration: TextDecoration.underline,fontSize: 20
        ),
      ),
    );
  }
}
