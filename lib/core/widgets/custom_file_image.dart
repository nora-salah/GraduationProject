import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({super.key, this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: FileImage(
                  File(image!.path),
                ),
                fit: BoxFit.fill,
              ),
            ),
          )
        : const SizedBox();
  }
}
