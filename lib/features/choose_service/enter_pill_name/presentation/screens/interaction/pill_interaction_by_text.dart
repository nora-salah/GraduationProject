import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
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

class PillInteractionByText extends StatelessWidget {
  const PillInteractionByText({Key? key}) : super(key: key);

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
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: BlocProvider.of<InteractionCubit>(context)
                        .pillList1
                        .map((pill) => pill.pills)
                        .toList()
                        .cast<String>(),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: " Enter Pill1 Name",
                    ),
                    //popupItemDisabled: isItemDisabled,
                    onChanged: (data) {
                      BlocProvider.of<InteractionCubit>(context)
                          .changePill(data);
                    },
                    showSearchBox: true,
                    searchFieldProps:
                        TextFieldProps(cursorColor: AppColors.primary),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: BlocProvider.of<InteractionCubit>(context).pillList2,
                    dropdownSearchDecoration: InputDecoration(
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
