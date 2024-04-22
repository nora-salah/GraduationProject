import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_google_nav_bar.dart';

import '../../../../../choose_option/cubits/home_cubit.dart';
import '../../../../../choose_option/cubits/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
          body: BlocProvider.of<HomeCubit>(context)
              .screens[BlocProvider.of<HomeCubit>(context).currentIndex],
          bottomNavigationBar: CustomGNav(
            onChanged: (value) {
              BlocProvider.of<HomeCubit>(context).changeIndex(value);
            },
            currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            tabs: [
              GButton(
                icon: Icons.home,
                text: AppStrings.home,
              ),
              GButton(icon: Icons.person, text: AppStrings.profile),
            ],
          ));
    });
  }
}
