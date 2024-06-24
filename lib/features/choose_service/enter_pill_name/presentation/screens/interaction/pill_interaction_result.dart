import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../models/interact_model.dart';

class PillInteractionRes extends StatelessWidget {
  PillInteractionRes({super.key, required this.dataModel});

  DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomGoBack(onPressed: () {
              Navigator.pop(context);
            }),
            Text(AppStrings.pillInteractionRes,
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary,
                            offset: Offset(0, 5), // Set the offset
                            blurRadius: 6, // Set the blur radius
                            spreadRadius: 1, // Set the spread radius
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(dataModel.pill1.photo),
                          fit: BoxFit
                              .cover, // This will stretch the image to cover the whole area
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      dataModel.pill1.name,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                              ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary,
                            offset: Offset(0, 5), // Set the offset
                            blurRadius: 6, // Set the blur radius
                            spreadRadius: 1, // Set the spread radius
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(dataModel.pill2.photo),
                          fit: BoxFit
                              .cover, // This will stretch the image to cover the whole area
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      dataModel.pill2.name,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                              ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 500.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.grey2,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        AppStrings.interactionType,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 30,
                                ),
                      ),
                      Text(
                        dataModel!.interactionType,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 29, color: Colors.red),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.interactionDescription,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 29,
                                ),
                      ),
                      Text(
                        dataModel!.interactionDescription,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 20, color: AppColors.teal),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.guides,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 30,
                                ),
                      ),
                      Text(
                        dataModel!.guides,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 20, color: AppColors.teal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
