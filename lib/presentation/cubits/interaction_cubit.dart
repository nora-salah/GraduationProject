import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/models/pills_model.dart';
import 'package:pill_detection/models/specific_pill_model.dart';
import 'package:pill_detection/repositories/interaction_repo.dart';
import 'package:pill_detection/repositories/pills_repo.dart';

import '../../models/interact_model.dart';
import 'interaction_state.dart';

class InteractionCubit extends Cubit<InteractionState> {
  InteractionCubit(this.pillsRepo,this.interactionRepo

  ) : super(InteractionInitial());
  final PillsRepo pillsRepo;
  GlobalKey<FormState> interactionKey = GlobalKey<FormState>();
  XFile? image;
  XFile? image2;
  final InteractionRepo interactionRepo;
  AllData? dataModel;
    AllData? dataModelImages;

  GlobalKey<FormState> uploadKey = GlobalKey<FormState>();

  uploadTwoImagesAndGetInteractionData() async {
    emit(InteractionImageLoading());
    final response =
        await interactionRepo.uploadTwoImages(image1: image!, image2: image2!);

    response.fold(
        (errMessage) => emit(InteractionImageFailed(errorMessage: errMessage)),
        (pillInteractModel) {
      dataModelImages = pillInteractModel;
      emit(InteractionImageSuccess(dataModelImages: pillInteractModel));
    });
  }

  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }

  void changeImage2(value2) {
    image2 = value2;
    emit(ChangeImageState2());
  }

  
  List<PillModel> pillList1 = [];
  late List pi1 = pillList1;
  List<String> allpills = [];
  void getAllPills() async {
    emit(GetAllPillsLoading());
    final response = await pillsRepo.getAllPills();
    response.fold(
      (errMessage) {
        emit(GetAllPillFailed(errorMessage: errMessage));
      },
      (getAllBlogsModel) {
        pillList1 = getAllBlogsModel.pills;
        for (PillModel i in pillList1) {
          allpills.add(i.name);
        }
        emit(GetAllPillsSuccess());
      },
    );
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

  String selectedPill1 = 'acc_long_600_mg';
  void changePill(pill) {
    selectedPill1 = pill;
    emit(ChangeItemState());
  }

  // Pill1NameInteraction;
  //String p1N = dataModel.interaction.pill1.name;

  getInteractionData() async {
    emit(InteractionLoading());
    final response = await interactionRepo
        .getInteraction(pill1: selectedPill1, pill2: selectedPill2);

    response
        .fold((errMessage) => emit(InteractionFailed(errorMessage: errMessage)),
            (pillInteractModel) {
      dataModel = pillInteractModel;
      emit(InteractionSuccess(dataModel: pillInteractModel));
    });
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
