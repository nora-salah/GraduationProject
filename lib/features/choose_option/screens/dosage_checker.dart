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
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        BlocProvider.of<DetectCubit>(context)
                            .detectDataModel!
                            .data!
                            .name!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 370,
                          height: 270.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.grey2,
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  "Dosage:",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Column(
                                  children: List.generate(
                                    BlocProvider.of<DetectCubit>(context)
                                        .detectDataModel!
                                        .data!
                                        .dosages!
                                        .length,
                                    (index) => Column(
                                      children: [
                                        Text(
                                          '* ${BlocProvider.of<DetectCubit>(context).detectDataModel!.data!.dosages![index].dosage!}',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.teal,
                                                fontSize: 20,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
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

/*


 contraindication Text(
                                  BlocProvider.of<DetectCubit>(context)
                                      .detectDataModel!
                                      .data!
                                      .contraindiacations![4]
                                      .contraindiacations!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.teal,
                                          fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  BlocProvider.of<DetectCubit>(context)
                                      .detectDataModel!
                                      .data!
                                      .contraindiacations![4]
                                      .contraindiacations!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.teal,
                                          fontSize: 20),
                                ),.sideEffects![0]
                                      .sideEffect!,





  return Scaffold(
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
