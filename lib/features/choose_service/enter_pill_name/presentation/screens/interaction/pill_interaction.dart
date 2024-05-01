import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_state.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/navigate.dart';

class PillInteraction extends StatelessWidget {
  const PillInteraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(37.0),
        child: BlocConsumer<InteractionCubit, InteractionState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<InteractionCubit>(context).interactionKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.pillInteraction,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 40,
                        ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    AppStrings.enterNameOfTwoTypes,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 91.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45.h,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          AppStrings.pill,
                        ),
                        icon: const Icon(
                          FontAwesomeIcons.capsules,
                          color: AppColors.primary,
                        ),
                        value: BlocProvider.of<InteractionCubit>(context)
                            .selectedPill2,
                        items: BlocProvider.of<InteractionCubit>(context)
                            .pillList2
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (data) {
                          BlocProvider.of<InteractionCubit>(context)
                              .changeItem2(data);
                        },
                      ),
                    ),
                  ),

                  /* CustomTextFormField(
                    controller: TextEditingController(),
                    hint: AppStrings.onePill,
                    icon2: (FontAwesomeIcons.capsules),
                  ),*/
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45.h,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          AppStrings.pill,
                        ),
                        icon: const Icon(
                          FontAwesomeIcons.capsules,
                          color: AppColors.primary,
                        ),
                        value: BlocProvider.of<InteractionCubit>(context)
                            .selectedPill,
                        items: BlocProvider.of<InteractionCubit>(context)
                            .pillList1
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (data) {
                          BlocProvider.of<InteractionCubit>(context)
                              .changePill(data);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 55.h,
                      width: 330.w,
                      child: CustomButton(
                          text: AppStrings.next,
                          onPressed: () {
                            customNavigate(context, "/pillInteractionRes");
                          }),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
