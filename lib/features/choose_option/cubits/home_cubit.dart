import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/home/home.dart';

import '../../profile/presentation/screens/profile_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens = [Home(), ProfileScreen()];
  int currenIndex = 0;
  void changeIndex(index) {
    currenIndex = index;
    emit(CurrenIndexState());
  }
}
