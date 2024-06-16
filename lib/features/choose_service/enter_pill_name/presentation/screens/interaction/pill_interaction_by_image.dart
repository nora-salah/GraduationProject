import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/interaction/pill_inter_res_by_image.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_state.dart';

import '../../../../../../core/widgets/custom_file_image.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../widgets/pick_image_widget.dart';

class PillInteractionByImage extends StatelessWidget {
  const PillInteractionByImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InteractionCubit, InteractionState>(
          listener: (context, state) {
        if (state is InteractionImageFailed) {
          showTwist(state: ToastStates.error, messege: state.errorMessage);
        } else if (state is InteractionImageSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PillInteractionResByImage(
                  dataModelImages: state.dataModelImages.data[0]),
            ),
          );
        }
      }, builder: (context, state) {
        final interactionCubit = BlocProvider.of<InteractionCubit>(context);

        return Form(
          key: interactionCubit.interactionKey,
          child: Column(
            children: [
              PickTwoImagesWidget(
                interactionCubit: interactionCubit,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomFileImage(image: interactionCubit.image),
                  CustomFileImage(image: interactionCubit.image2),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              state is InteractionImageLoading
                  ? CircularProgressIndicator(
                      backgroundColor: AppColors.primary,
                    )
                  : SizedBox(
                      width: 400.w,
                      child: CustomButton(
                          text: AppStrings.showInteraction,
                          onPressed: () {
                            if (BlocProvider.of<InteractionCubit>(context)
                                        .image !=
                                    null &&
                                BlocProvider.of<InteractionCubit>(context)
                                        .image2 !=
                                    null) {
                              BlocProvider.of<InteractionCubit>(context)
                                  .uploadTwoImagesAndGetInteractionData();
                            }
                          }),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
