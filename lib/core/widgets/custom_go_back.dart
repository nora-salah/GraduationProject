import 'package:flutter/material.dart';

class CustomGoBack extends StatelessWidget {
  const CustomGoBack({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 30,
          ),
        ),
        const Icon(
          Icons.more_vert,
          size: 35,
        ),
      ],
    );
  }
}
