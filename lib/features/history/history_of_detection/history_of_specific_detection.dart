import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/presentation/cubits/hitory_cubit/history_cubit.dart';
import 'package:pill_detection/presentation/cubits/hitory_cubit/history_state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../choose_option/screens/dosage_checker.dart';

class HistoryOfSpecificDetection extends StatelessWidget {
  const HistoryOfSpecificDetection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocConsumer<HistoryCubit, HistoryState>(
            listener: (context, state) {
          if (state is SDetectHistoryFailureState) {
            showTwist(state: ToastStates.error, messege: state.errorMessage);
          }
        }, builder: (context, state) {
          return state is SDetectHistoryLoading
              ? const CircularProgressIndicator(
                  color: AppColors.primary,
                )
              : BlocProvider.of<HistoryCubit>(context).detectDataModel != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomGoBack(onPressed: () {
                          Navigator.pop(context);
                        }),
                        SizedBox(
                          height: 26.h,
                        ),
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
                            image: DecorationImage(
                              image: NetworkImage(
                                  BlocProvider.of<HistoryCubit>(context)
                                      .detectDataModel!
                                      .data!
                                      .photo!),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),

                          //Image(image: AssetImage(AppAssets.fake)),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: double.infinity,
                            height: 300.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.primaryLight,
                            ),
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    BlocProvider.of<HistoryCubit>(context)
                                        .detectDataModel!
                                        .data!
                                        .name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: 33),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    BlocProvider.of<HistoryCubit>(context)
                                        .detectDataModel!
                                        .data!
                                        .description!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomService(
                                text: AppStrings.morePillInfo2,
                                onPressed: () {
                                  customNavigate(context, "/moreInfo");
                                },
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              CustomService(
                                text: AppStrings.sideEffect2,
                                onPressed: () {
                                  customNavigate(context, "/sideEffect");
                                },
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              CustomService(
                                text: AppStrings.dosageChecker,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DosageChecker()));
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : const SizedBox();
        }),
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
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
