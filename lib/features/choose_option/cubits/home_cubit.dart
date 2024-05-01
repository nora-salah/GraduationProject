
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/home/home.dart';

import '../../profile/presentation/screens/profile_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens = [const Home(), const ProfileScreen()];
  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(CurrenIndexState());
  }
}
