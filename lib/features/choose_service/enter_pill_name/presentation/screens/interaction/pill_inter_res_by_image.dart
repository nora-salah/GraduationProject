import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';
import 'package:pill_detection/models/interact_model.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../../presentation/cubits/interaction_cubit.dart';
import '../../../../../../presentation/cubits/interaction_state.dart';

class PillInteractionResByImage extends StatelessWidget {
  PillInteractionResByImage({super.key, required this.dataModelImages});

  DataModel dataModelImages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<InteractionCubit, InteractionState>(
            listener: (context, state) {
          if (state is InteractionFailed) {
            showTwist(state: ToastStates.error, messege: state.errorMessage);
          }
        }, builder: (context, state) {
          // final interactionCubit = BlocProvider.of<InteractionCubit>(context);

          return state is InteractionImageLoading
              ? const CircularProgressIndicator(
                  color: AppColors.primary,
                )
              : BlocProvider.of<InteractionCubit>(context).dataModel != null
                  ? Column(
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
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.primary,
                                        offset: Offset(0, 5), // Set the offset
                                        blurRadius: 6, // Set the blur radius
                                        spreadRadius:
                                            1, // Set the spread radius
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          dataModelImages.pill1.photo),
                                      fit: BoxFit
                                          .cover, // This will stretch the image to cover the whole area
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  AppStrings.pillInteractionRes,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
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
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.primary,
                                        offset: Offset(0, 5), // Set the offset
                                        blurRadius: 6, // Set the blur radius
                                        spreadRadius:
                                            1, // Set the spread radius
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          dataModelImages.pill2.photo),
                                      fit: BoxFit
                                          .cover, // This will stretch the image to cover the whole area
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  AppStrings.pillInteractionRes,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 30,
                                        ),
                                  ),
                                  Text(
                                    dataModelImages!.interactionType,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: 29, color: Colors.orange),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    AppStrings.interactionDescription,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 29,
                                        ),
                                  ),
                                  Text(
                                    dataModelImages!.interactionDescription,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            color: AppColors.teal),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    AppStrings.guides,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 30,
                                        ),
                                  ),
                                  Text(
                                    dataModelImages!.guides,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            color: AppColors.teal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox();
        }),
      ),
    );
  }
}
