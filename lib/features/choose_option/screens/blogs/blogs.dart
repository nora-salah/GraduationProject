import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/navigate.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text_field.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList;
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 160.h,
              width: 430.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                color: AppColors.primary,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      CustomGoBack(onPressed: () {}),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomTextFormField2(
                        controller: TextEditingController(),
                        label: AppStrings.search,
                        icon2: Icons.search,
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 19.h,
          ),
          CustomContainerBlog(
            btnText: AppStrings.showBlog,
            img: AppAssets.pi1,
            text: AppStrings.pillName,
            onPressed: () {
              customNavigate(context, "/pillDetectionService");
            },
          ),
        ],
      ),
    );
  }
}
/* return ListTile(
              title: Text(dataList[index]['title']),
              subtitle: Text(dataList[index]['subtitle']),
            );*/
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';
import 'package:pill_detection/features/auth/presentation/cubit/blogs_cubit.dart';
import 'package:pill_detection/features/auth/presentation/cubit/blogs_state.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/navigate.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text_field.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);
/*if (dataList.isEmpty) {
            // Fetch data when the dataList is empty
            context.read<BlogsCubit>().fetchData();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BlogsCubit, BlogsState>(
        listener: (context, dataList) {},
        builder: (context, dataList) {
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataList[index]['title']),
                subtitle: Text(dataList[index]['subtitle']),
              );
            },
          );
        },
      ),
    );
  }
}

/*Column(
        children: [
          Container(
              height: 160.h,
              width: 430.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                color: AppColors.primary,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      CustomGoBack(onPressed: () {}),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomTextFormField2(
                        controller: TextEditingController(),
                        label: AppStrings.search,
                        icon2: Icons.search,
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 19.h,
          ),
          CustomContainer(
            btnText: AppStrings.showBlog,
            img: AppAssets.pi1,
            text: AppStrings.pill,
            text2: AppStrings.detection,
            onPressed: () {
              customNavigate(context, "/pillDetectionService");
            },
          ),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),*/
*/
/*          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return CustomContainer(
                  btnText: AppStrings.showBlog,
                  img: AppAssets.pills,
                  text: dataList[index]['subtitle'],
                  text2: AppStrings.pillName,
                  onPressed: () {
                    customNavigate(context, "/pillDetectionService");
                  },
                );
              },
            ),
          ),
*/
