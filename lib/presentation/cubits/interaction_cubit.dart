import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'interaction_state.dart';

class InteractionCubit extends Cubit<InteractionState> {
  InteractionCubit() : super(InteractionInitial());
  GlobalKey<FormState> interactionKey = GlobalKey<FormState>();
  XFile? image;

  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }

  void changeImage2(value2) {
    image = value2;
    emit(ChangeImageState2());
  }

  void changeImage22(value2) {
    image = value2;
    emit(ChangeImageState2());
  }

  List<String> pillList1 = [
    '1st Pill',
    'Banadol',
    'Ch',
    'F1',
    'Se',
    'Po',
    'Lam',
    'Vegeta',
    'Vegan',
    'Glu-free',
  ];
  String selectedPill = '1st Pill';
  void changePill(pill) {
    selectedPill = pill;
    emit(ChangeItemState());
  }

  List<String> pillList2 = [
    '2st Pill',
    'Banadol',
    'Banadol2',
    'Ch',
    'F1',
    '23st Pill',
    'Banadol1',
    'Ch1',
    'F11',
    'Se1',
    'Po1',
    'Lam2',
    'Vegeta2',
    'Vegan2',
    'Gluy-free',
    'Se',
    'Po',
    'Lam',
    'Vegeta',
    'Vegan',
    'Glu-free',
  ];
  String selectedPill2 = '2st Pill';
  void changeItem2(pill2) {
    selectedPill2 = pill2;
    emit(ChangeItemState2());
  }
}

/* '1',
    '2',
    '23',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '44',*/
