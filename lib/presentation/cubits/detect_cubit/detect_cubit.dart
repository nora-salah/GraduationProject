import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/detect_model.dart';
import '../../../models/detect_opttions_model.dart';
import '../../../repositories/detect_repo.dart';
import 'detect_state.dart';

class DetectCubit extends Cubit<DetectState> {
  DetectCubit(
    this.detectRepo,
  ) : super(DetectInitial());
  DetectRepo? detectRepo;
  XFile? image;
  GlobalKey<FormState> uploadKey = GlobalKey<FormState>();

  uploadImageAndGetData() async {
    emit(DetectLoadingState());
    final response = await detectRepo!.uploadImage(image: image!);

    response.fold(
      (errMessage) => emit(DetectFailureState(errorMessage: errMessage)),
      (user) => emit(DetectSuccessState(detectModel: user)),
    );
  }

  //PillDetectModel? detectDataModel;

  //change image from use
  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }

  List<DosageDetectModel> dosageDetect = [];
  late List dosage = dosageDetect;

  List<SideEffectDetectModel> sideEffectDetect = [];
  late List sideEffect = sideEffectDetect;

  List<ContraindicationModel> constrainDetect = [];
  late List constrain = constrainDetect;

  getDetectionDosageData() async {
    emit(DetectDosageLoading());
    final response = await detectRepo!.getDetectionDosageData(id: 'id');

    response.fold(
      (errMessage) => emit(DetectDosageFailure(errorMessage: errMessage)),
      (dosage) => emit(DetectDosageSuccess()),
    );
  }

  getDetectionSideEffect() async {
    emit(DetectSideEffectLoading());
    final response = await detectRepo!.getDetectionDSideEffect(id: 'id');

    response.fold(
      (errMessage) => emit(DetectSideEffectFailure(errorMessage: errMessage)),
      (dosage) => emit(DetectSideEffectSuccess()),
    );
  }

  getDetectionConstrains() async {
    emit(DetectConstrainLoading());
    final response = await detectRepo!.getDetectionContraindiacations(id: 'id');

    response.fold(
      (errMessage) => emit(DetectConstrainFailure(errorMessage: errMessage)),
      (dosage) => emit(DetectConstrainSuccess()),
    );
  }
}
