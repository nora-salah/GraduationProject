import '../../../models/detect_models/pill_detect_model.dart';

abstract class DetectState {}

class DetectInitial extends DetectState {}

class DetectLoadingState extends DetectState {}

class ChangeImageState extends DetectState {}

class DetectSuccessState extends DetectState {
  final PillDetectModel detectModel;

  DetectSuccessState({required this.detectModel});
}

class DetectFailureState extends DetectState {
  final String errorMessage;

  DetectFailureState({required this.errorMessage});
}

class DetectSideEffectLoading extends DetectState {}

class DetectSideEffectSuccess extends DetectState {
  /* final SideEffectDetectModel sideEffectDetectModel;
  DetectSideEffectSuccess({required this.sideEffectDetectModel})*/
}

class DetectSideEffectFailure extends DetectState {
  final String errorMessage;

  DetectSideEffectFailure({required this.errorMessage});
}

class DetectDosageLoading extends DetectState {}

class DetectDosageSuccess extends DetectState {}

class DetectDosageFailure extends DetectState {
  final String errorMessage;

  DetectDosageFailure({required this.errorMessage});
}

class DetectConstrainLoading extends DetectState {}

class DetectConstrainSuccess extends DetectState {}

class DetectConstrainFailure extends DetectState {
  final String errorMessage;

  DetectConstrainFailure({required this.errorMessage});
}
