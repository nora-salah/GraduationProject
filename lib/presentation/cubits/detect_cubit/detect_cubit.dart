import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/models/detect_models/detect_model.dart';
import '../../../models/detect_models/detect_opttions_model.dart';
import '../../../models/detect_models/pill_detect_model.dart';
import '../../../repositories/detect_repo.dart';
import 'detect_state.dart';

class DetectCubit extends Cubit<DetectState> {
  DetectCubit(this.detectRepo) : super(DetectInitial());

  DetectRepo? detectRepo;
  XFile? image;
  List<DosageDetectModel> dosageDetect = [];
  late List dosage = dosageDetect;
  List<SideEffectDetectModel> sideEffectDetect = [];
  late List sideEffect = sideEffectDetect;
  List<ContraindicationModel> constrainDetect = [];
  late List constrain = constrainDetect;
  GlobalKey<FormState> uploadKey = GlobalKey<FormState>();
  PillDetectModel? detectDataModel;

  uploadImageAndGetData() async {
    emit(DetectLoadingState());
    final response = await detectRepo!.uploadImage(image: image!);

    response.fold(
        (errMessage) => emit(DetectFailureState(errorMessage: errMessage)),
        (pillDetectModel) {
      detectDataModel = pillDetectModel;
      emit(DetectSuccessState(detectModel: pillDetectModel));
    });
  }

  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }

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
