import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/models/pills_model.dart';
import 'package:pill_detection/repositories/pills_repo.dart';

import 'interaction_state.dart';

class InteractionCubit extends Cubit<InteractionState> {
  InteractionCubit() : super(InteractionInitial());
  GlobalKey<FormState> interactionKey = GlobalKey<FormState>();
  XFile? image;
  XFile? image2;

  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }

  void changeImage2(value2) {
    image2 = value2;
    emit(ChangeImageState2());
  }

  PillsRepo? pillsRepo;
  List<GetAllPillsModel> pillList1 = [];
  late List pi1 = pillList1;

  void getAllPills() async {
    emit(GetAllPillsLoading());
    final response = await pillsRepo!.getAllPills();
    response.fold(
      (errMessage) {
        emit(GetAllPillFailed(errorMessage: errMessage));
      },
      (getAllBlogsModel) {
        pillList1 = getAllBlogsModel.pills.cast<GetAllPillsModel>();
        emit(GetAllPillsSuccess());
      },
    );
  }

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
