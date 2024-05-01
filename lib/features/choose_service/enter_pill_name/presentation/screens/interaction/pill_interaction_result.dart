
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PillInteractionRes extends StatelessWidget {
  const PillInteractionRes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Row(
             children: [
               const Column(
                 children: [],
               ),
               SizedBox(
                 width: 25.w,
               ),
               const Column(
                 children: [],
               )
             ],
           )
        ],
      ),
    );
  }
}
