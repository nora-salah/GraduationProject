import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../../presentation/cubits/detect_cubit/detect_cubit.dart';
import '../../../presentation/cubits/detect_cubit/detect_state.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({
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
                          width: 380,
                          height: 290.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.grey2,
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  "Contraindiacations:",
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
                                        .contraindiacations!
                                        .length,
                                    (index) => Column(
                                      children: [
                                        Text(
                                          '* ${BlocProvider.of<DetectCubit>(context).detectDataModel!.data!.contraindiacations![index].contraindiacation!}',
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

class CustomPillImage extends StatelessWidget {
  final String imageUrl;

  const CustomPillImage({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 400,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(0, 7),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
