import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_strings.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../../presentation/cubits/detect_cubit/detect_cubit.dart';
import '../../../presentation/cubits/detect_cubit/detect_state.dart';
import 'dosage_checker.dart';
import 'more_info.dart';

class SideEffect extends StatelessWidget {
  const SideEffect({
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
        print(BlocProvider.of<DetectCubit>(context)
            .detectDataModel!
            .data!
            .contraindiacations![1]
            .contraindiacation);
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
                          height: 250.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.grey2,
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  "SideEffects:",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Column(
                                  children: List.generate(
                                    BlocProvider.of<DetectCubit>(context)
                                        .detectDataModel!
                                        .data!
                                        .sideEffects!
                                        .length,
                                    (index) => Column(
                                      children: [
                                        Text(
                                          '* ${BlocProvider.of<DetectCubit>(context).detectDataModel!.data!.sideEffects![index].sideEffect!}',
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

class CustomPillService extends StatelessWidget {
  const CustomPillService({
    super.key,
    this.text1,
    this.text2,
  });
  final String? text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //
              text1!,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              //
              text2!,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/*class CustomPillImage extends StatelessWidget {
  const CustomPillImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: 400,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(0, 7), // Set the offset
              blurRadius: 5, // Set the blur radius
              spreadRadius: 1, // Set the spread radius
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: const Image(
          image: AssetImage(AppAssets.pills),
        ));
  }
}
class AppAssets {
  static const String basePath = 'assets/images/';
  static const String splash = '${basePath}splash.jpg';
}
*/
