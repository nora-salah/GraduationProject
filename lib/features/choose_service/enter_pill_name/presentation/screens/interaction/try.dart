import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/navigate.dart';
import '../../../../../../core/widgets/custom_go_back.dart';

class FakeHistory extends StatelessWidget {
  const FakeHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 160.h,
                width: 430.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                  ),
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomGoBack(onPressed: () {
                          customNavigate(context, "/homeScreen");
                        }),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "History Of Interaction",
                          maxLines: 2, // Set the maximum number of lines to 2
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        /*CustomTextFormField2(
                            controller: BlocProvider.of<HistoryCubit>(context)
                                .searchController,
                            label: AppStrings.search,
                            icon2: Icons.search,
                            onChange: (value) {
                              BlocProvider.of<BlogsCubit>(context)
                                  .filteredSearch(value!);
                              return null;
                            },
                          ),*/
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 375.w,
              height: 270.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primary,
                    offset: Offset(0, 2), // Set the offset
                    blurRadius: 3, // Set the blur radius
                    spreadRadius: 1, // Set the spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Specify your border color here
                              width: 1.0, // Specify the border width
                            ),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.hf1),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Specify your border color here
                              width: 1.0, // Specify the border width
                            ),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.hf2),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Interaction Type:",
                      maxLines: 2, // Set the maximum number of lines to 2
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "severe",
                      maxLines: 2, // Set the maximum number of lines to 2
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontWeight: FontWeight.normal, color: Colors.red),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 120.w,
                          height: 32.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Show",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 32.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.delete,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 375.w,
              height: 270.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primary,
                    offset: Offset(0, 2), // Set the offset
                    blurRadius: 3, // Set the blur radius
                    spreadRadius: 1, // Set the spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Specify your border color here
                              width: 1.0, // Specify the border width
                            ),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.hf3),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Specify your border color here
                              width: 1.0, // Specify the border width
                            ),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.hf4),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Interaction Type:",
                      maxLines: 2, // Set the maximum number of lines to 2
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "moderate",
                      maxLines: 2, // Set the maximum number of lines to 2
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.orange),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 120.w,
                          height: 32.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Show",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 32.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.delete,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 375.w,
              height: 270.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primary,
                    offset: Offset(0, 2), // Set the offset
                    blurRadius: 3, // Set the blur radius
                    spreadRadius: 1, // Set the spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Specify your border color here
                              width: 1.0, // Specify the border width
                            ),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.hf2),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Specify your border color here
                              width: 1.0, // Specify the border width
                            ),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.hf4),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Interaction Type:",
                      maxLines: 2, // Set the maximum number of lines to 2
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "severe",
                      maxLines: 2, // Set the maximum number of lines to 2
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontWeight: FontWeight.normal, color: Colors.red),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 120.w,
                          height: 32.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Show",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 32.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.delete,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
