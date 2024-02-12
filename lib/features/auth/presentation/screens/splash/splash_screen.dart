import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/navigate.dart';
import '../../../../../core/widgets/custom_button.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          CustomButton(text: AppStrings.signin, onPressed: () {
            customNavigate(context, "signInScreen");
          }),
        ],
      ) ,
    );
  }
}
/*return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 291,
              width: 345,
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
              child:Center(child: Icon(Icons.image,size: 250,color: AppColors.lightGrey,)),
              //Image(image: AssetImage(AppAssets.fake)),
            ),
            SizedBox(
              height: 26,
            ),
            Text(
              AppStrings.pillName,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              AppStrings.activeIngredientInThePill,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 110,
            ),

          ],
        ),
      ),
    );*/