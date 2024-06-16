import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/models/detect_models/detect_opttions_model.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../../presentation/cubits/detect_cubit/detect_cubit.dart';
import '../../../presentation/cubits/detect_cubit/detect_state.dart';

class DosageChecker extends StatelessWidget {
  const DosageChecker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetectCubit, DetectState>(listener: (context, state) {
        if (state is DetectFailureState) {
          showTwist(state: ToastStates.error, messege: state.errorMessage);
        }
      }, builder: (context, state) {
        return state is DetectLoadingState
            ? const CircularProgressIndicator(
                color: AppColors.primary,
              )
            : BlocProvider.of<DetectCubit>(context).detectDataModel != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomGoBack(onPressed: () {
                        customNavigate(context, "/pillDetectionService");
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
                                BlocProvider.of<DetectCubit>(context)
                                    .detectDataModel!
                                    .data!
                                    .photo!),
                            fit: BoxFit
                                .cover, // This will stretch the image to cover the whole area
                          ),
                        ),

                        //Image(image: AssetImage(AppAssets.fake)),
                      ),
                      Text(
                        BlocProvider.of<DetectCubit>(context)
                            .detectDataModel!
                            .data!
                            .name!,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: [
                          Text(
                            "Dosages:",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            BlocProvider.of<DetectCubit>(context)
                                .detectDataModel!
                                .data!
                                .dosages![0]
                                .dosage!,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primary),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: BlocProvider.of<DetectCubit>(context)
                                .allDosages!
                                .length,
                            itemBuilder: (context, index) {
                              return showDosage(
                                model: BlocProvider.of<DetectCubit>(context)
                                    .allDosages[index],
                                context: context,
                              );
                            }),
                      ),
                    ],
                  )
                : const SizedBox();
      }),
    );
  }
}

Widget showDosage({required Dosage model, required BuildContext context}) {
  return Container(
    color: Colors.grey,
    child: Column(
      children: [
        Text(
          "Dosage",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          model.dosage!,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.normal, color: AppColors.primary),
        ),
      ],
    ),
  );
}

/*    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
            BlocConsumer<DetectCubit, DetectState>(listener: (context, state) {
          if (state is DetectFailureState) {
            showTwist(state: ToastStates.error, messege: state.errorMessage);
          }
        }, builder: (context, state) {
          return state is DetectLoadingState
              ? const CircularProgressIndicator(
                  color: AppColors.primary,
                )
              : BlocProvider.of<DetectCubit>(context).detectDataModel != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomGoBack(onPressed: () {
                          customNavigate(context, "/pillDetectionService");
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
                                  BlocProvider.of<DetectCubit>(context)
                                      .detectDataModel!
                                      .data!
                                      .photo!),
                              fit: BoxFit
                                  .cover, // This will stretch the image to cover the whole area
                            ),
                          ),

                          //Image(image: AssetImage(AppAssets.fake)),
                        ),
                        Text(
                          ''' BlocProvider.of<DetectCubit>(context)
                              .dosageModel!
                              .dosage!''',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          child: ListView.builder(
                              itemCount: BlocProvider.of<DetectCubit>(context)
                                  .dosage!
                                  .length,
                              itemBuilder: (context, index) {
                                context
                                    .read<DetectCubit>()
                                    .getDetectionDosageData();

                                return Column(
                                  children: [
                                    Text(
                                      "dosage",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Text(
                                      BlocProvider.of<DetectCubit>(context)
                                          .dosageModel!
                                          .dosage!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    )
                  : const SizedBox();
        }),
      ),
    );
*/
/*class DosageChecker extends StatelessWidget {
  const DosageChecker({
    Key? key,
    this.detectDosageModel,
    this.detectModel,
  }) : super(key: key);

  final Dosage? detectDosageModel;
  final Data? detectModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              CustomGoBack(onPressed: () {
                customNavigate(context, "/pillDetectionService");
              }),
              SizedBox(
                height: 26.h,
              ),
              Container(
                height: 291.h,
                width: 390.w,
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
                    image: NetworkImage(detectModel!.photo!),
                    fit: BoxFit
                        .cover, // This will stretch the image to cover the whole area
                  ),
                ),

                //Image(image: AssetImage(AppAssets.fake)),
              ),
              Text(
                detectModel!.name!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount:
                        BlocProvider.of<DetectCubit>(context).dosage!.length,
                    itemBuilder: (context, index) {
                      /*context
                                    .read<DetectCubit>()
                                    .getDetectionDosageData();*/

                      return Container(
                        height: 200,
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              "dosage",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              detectDosageModel!.dosage!,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
*/
