import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/interaction/pill_interaction_result.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_state.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/custom_toast.dart';

class PillInteractionByText extends StatelessWidget {
  const PillInteractionByText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(37.0),
        child: BlocConsumer<InteractionCubit, InteractionState>(
          listener: (context, state) {
            if (state is InteractionSuccess) {
              showTwist(state: ToastStates.success, messege: AppStrings.done);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PillInteractionRes(
                          dataModel: state.dataModel.data[0],
                        )),
              );
            } else if (state is InteractionFailed) {
              showTwist(state: ToastStates.error, messege: AppStrings.filed);
            }
          },
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
                  DropdownSearch(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: BlocProvider.of<InteractionCubit>(context).allpills,
                    //BlocProvider.of<InteractionCubit>(context)
                    //                         .pillList1
                    //                         .map((item) => item.toString())
                    //                         .toList(),
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: " Enter Pill1 Name",
                    ),
                    //popupItemDisabled: isItemDisabled,
                    onChanged: (data) {
                      /*BlocProvider.of<InteractionCubit>(context)
                          .changePill(data!);
                      return null;
                      BlocProvider.of<InteractionCubit>(context)
                          .getInteractionData();*/

                      context.read<InteractionCubit>().changePill(data);
                    },
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: AppColors.primary),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: BlocProvider.of<InteractionCubit>(context).allpills,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: " Enter Pill Name",
                    ),
                    //popupItemDisabled: isItemDisabled,
                    onChanged: (data) {
                      BlocProvider.of<InteractionCubit>(context)
                          .changeItem2(data);
                    },
                    showSearchBox: true,
                    searchFieldProps:
                        TextFieldProps(cursorColor: AppColors.primary),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 65.h,
                      width: 390.w,
                      child: CustomButton(
                          text: AppStrings.next,
                          onPressed: () {
                            if (BlocProvider.of<InteractionCubit>(context)
                                        .selectedPill1 !=
                                    null &&
                                BlocProvider.of<InteractionCubit>(context)
                                        .selectedPill2 !=
                                    null) {
                              BlocProvider.of<InteractionCubit>(context)
                                  .getInteractionData();
                              //customNavigate(context, "/pillInteractionRes");
                            }
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
/*
  bool isItemDisabled(String s) {
    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }*/
}

/* CustomTextFormField(
                    controller: TextEditingController(),
                    hint: AppStrings.onePill,
                    icon2: (FontAwesomeIcons.capsules),
                  ),*/
