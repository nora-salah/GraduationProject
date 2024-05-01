import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({super.key, this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(
                  File(image!.path),
                ), // Replace 'assets/background.jpg' with your image path
                fit: BoxFit.cover, // You can adjust the fit based on your needs
              ),
            ),
            // Other properties of your Container
          )
        : Container();
  }
}
