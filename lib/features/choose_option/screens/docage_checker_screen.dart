import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/navigate.dart';
import 'package:pill_detection/core/widgets/custom_text_field.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_button.dart';

class DosageCheckerScreen extends StatelessWidget {
   DosageCheckerScreen({Key? key}) : super(key: key);


  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.dosageChecker,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 37,
                ),
                Container(
                  width: 345.w,
                  height: 291.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.primary,
                        offset: Offset(0, 5), // Set the offset
                        blurRadius: 6, // Set the blur radius
                        spreadRadius: 1, // Set the spread radius
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Image(image: AssetImage(AppAssets.pills)),
                ),
                //image
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  AppStrings.pillName,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 39,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  label: AppStrings.age,
                  icon2: Icons.calendar_month_outlined,
                ),
                SizedBox(
                  height: 15,
                ),
                //custom
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // Add more decoration..
                  ),
                  hint: const Text(
                    AppStrings.gender,
                    style: TextStyle(fontSize: 14),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primary,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),



                //
                SizedBox(
                  height: 53.h,
                ),
                SizedBox(
                  height: 55.h,
                  width: 330.w,
                  child: CustomButton(
                      text: AppStrings.next,
                      onPressed: () {
                        customNavigate(context, "/dosageChecker");
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
