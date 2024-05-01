import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_cubit.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_state.dart';
import 'package:pill_detection/features/choose_option/screens/blogs/spacific_blog.dart';
import 'package:pill_detection/models/blog_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/navigate.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_toast.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BlogsCubit, BlogsState>(listener: (context, state) {
        if (state is GetAllBlogsSuccess) {
          showTwist(state: ToastStates.success, messege: AppStrings.done);
        } else if (state is GetAllBlogsFailure) {
          showTwist(state: ToastStates.error, messege: AppStrings.filed);
        }
      }, builder: (context, state) {
        return Column(
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
                        CustomGoBack(onPressed: () {
                          customNavigate(context, "/homeScreen");
                        }),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomTextFormField2(
                          controller: BlocProvider.of<BlogsCubit>(context)
                              .searchController,
                          label: AppStrings.search,
                          icon2: Icons.search,
                          onChange: (value) {
                            BlocProvider.of<BlogsCubit>(context)
                                .filteredSearch(value!);
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 19.h,
            ),
            state is GetAllBlogsLoading
                ? const CircularProgressIndicator(
                    color: AppColors.primary,
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: BlocProvider.of<BlogsCubit>(context)
                            .filteredBlogsSearchList
                            .length,
                        itemBuilder: (context, index) {
                          return showBlog(
                              model: BlocProvider.of<BlogsCubit>(context)
                                  .filteredBlogsSearchList[index],
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SpecificBlog(
                                          blogDetails: BlocProvider.of<
                                                  BlogsCubit>(context)
                                              .filteredBlogsSearchList[index],
                                        )));
                              },
                              context: context);
                        }),
                  )
          ],
        );
      }),
    );
  }
}

Widget showBlog(
    {required BlogModel model,
    required VoidCallback onPressed,
    required BuildContext context}) {
  return Column(
    children: [
      CustomContainerBlog(
        btnText: AppStrings.showBlog,
        img: model.photo,
        text: model.title,
        onPressed: onPressed,
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
