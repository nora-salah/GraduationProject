import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key, required this.icon, required this.onPressed,
  });
  //final Widget label;
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style:  const ButtonStyle(
        iconColor: MaterialStatePropertyAll(AppColors.primary),
      ),
      onPressed: onPressed,
      icon: icon,
      //label: label,
    );
  }
}
