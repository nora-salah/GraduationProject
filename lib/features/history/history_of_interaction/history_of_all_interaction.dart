import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/models/history_interact_model.dart';
import 'package:pill_detection/presentation/cubits/hitory_cubit/history_cubit.dart';
import 'package:pill_detection/presentation/cubits/hitory_cubit/history_state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_container.dart';
import '../../../core/widgets/custom_go_back.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/custom_toast.dart';
import 'history_of_specific_interaction.dart';

class AllOfIHistory extends StatelessWidget {
  const AllOfIHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<HistoryCubit, HistoryState>(listener: (context, state) {
        if (state is HistoryInteractionSuccess) {
          showTwist(state: ToastStates.success, messege: AppStrings.done);
        } else if (state is HistoryInteractionFailure) {
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
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomGoBack(onPressed: () {
                          Navigator.pop(context);
                        }),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "History Of Interaction",
                          maxLines: 2, // Set the maximum number of lines to 2
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        /*CustomTextFormField2(
                          controller: BlocProvider.of<HistoryCubit>(context)
                              .searchController,
                          label: AppStrings.search,
                          icon2: Icons.search,
                          onChange: (value) {
                            BlocProvider.of<BlogsCubit>(context)
                                .filteredSearch(value!);
                            return null;
                          },
                        ),*/
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 19.h,
            ),
            state is HistoryInteractionLoading
                ? const CircularProgressIndicator(
                    color: AppColors.primary,
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: BlocProvider.of<HistoryCubit>(context)
                            .allIHistory
                            .length,
                        itemBuilder: (context, index) {
                          return showContainer(
                              model: BlocProvider.of<HistoryCubit>(context)
                                  .allIHistory[index],
                              onPressed: () {
                                BlocProvider.of<HistoryCubit>(context)
                                    .getSpecificIHistory(
                                        BlocProvider.of<HistoryCubit>(context)
                                            .iHistoryList[index]
                                            .id);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        HistoryOfSpecificInteraction(
                                          dataModel:
                                              BlocProvider.of<HistoryCubit>(
                                                      context)
                                                  .interactDataModel!,
                                        )));
                                /* Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        HistoryOfSpecificInteraction(
                                          dataModel:
                                              BlocProvider.of<HistoryCubit>(
                                                      context)
                                                  .allIHistory[index],
                                        )
                                        )
                                        );*/
                              },
                              onPressedDelete: () {
                                BlocProvider.of<HistoryCubit>(context)
                                    .deleteSpecificIHistory(
                                        BlocProvider.of<HistoryCubit>(context)
                                            .iHistoryList[index]
                                            .id);
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

Widget showContainer(
    {required IHistory model,
    required VoidCallback onPressed,
    required VoidCallback onPressedDelete,
    required BuildContext context}) {
  return Column(
    children: [
      CustomContainerHistory(
        btnText: AppStrings.showIH,
        img: model.p1Photo,
        text: model.interactionType,
        onPressed: onPressed,
        onPressedDelete: onPressedDelete,
        img2: model.p2Photo,
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}

class CustomContainerHistory extends StatelessWidget {
  const CustomContainerHistory({
    super.key,
    required this.text,
    required this.onPressed,
    required this.btnText,
    required this.img,
    required this.img2,
    required this.onPressedDelete,
  });

  final String text;

  final String img;
  final String img2;

  final String btnText;

  final VoidCallback onPressed;
  final VoidCallback onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            offset: Offset(0, 2), // Set the offset
            blurRadius: 3, // Set the blur radius
            spreadRadius: 1, // Set the spread radius
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*CircleAvatar(
            backgroundColor: AppColors.white,
            backgroundImage: AssetImage(img),
            radius: 90,
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100.w,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.white, // Specify your border color here
                    width: 1.0, // Specify the border width
                  ),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit
                        .cover, // This will stretch the image to cover the whole area
                  ),
                ),
              ),
              Container(
                width: 100.w,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.white, // Specify your border color here
                    width: 1.0, // Specify the border width
                  ),
                  image: DecorationImage(
                    image: NetworkImage(img2),
                    fit: BoxFit
                        .cover, // This will stretch the image to cover the whole area
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            text,
            maxLines: 2, // Set the maximum number of lines to 2
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 24.h,
          ),
          /*Text(
            "text2",
            maxLines: 2, // Set the maximum number of lines to 2
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 24.h,
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120.w,
                height: 32.h,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    btnText,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                width: 120.w,
                height: 32.h,
                child: ElevatedButton(
                  onPressed: onPressedDelete,
                  child: Text(
                    AppStrings.delete,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
