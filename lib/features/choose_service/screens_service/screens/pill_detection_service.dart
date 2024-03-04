import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';

class PillDetectionService extends StatelessWidget {
  PillDetectionService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 291.h,
              width: 345.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grey,
                    offset: Offset(0, 5), // Set the offset
                    blurRadius: 6, // Set the blur radius
                    spreadRadius: 1, // Set the spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Icon(
                Icons.image,
                size: 250,
                color: AppColors.lightGrey,
              )),
              //Image(image: AssetImage(AppAssets.fake)),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              AppStrings.pillName,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              AppStrings.activeIngredientInThePill,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 110,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomService(
                    text: AppStrings.morePillInfo2,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  CustomService(
                    text: AppStrings.sideEffect2,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  CustomService(
                    text: AppStrings.dosageChecker,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomService extends StatelessWidget {
  const CustomService({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 145.h,
      width: 158.w,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 26),
          ),
        ),
      ),
    );
  }
}

/*          ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {}, child: Text("${op[index].name}")),
                  SizedBox(
                    width: 16,
                  )
                ],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: 3,
          )

          final List<Option> op = [
    Option(name:),
    Option(name: ),
    Option(name: AppStrings.),
    class Option {
  final String name;

  Option({
    required this.name,
  });
}

  ];
*/
