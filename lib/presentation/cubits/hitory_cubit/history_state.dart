import 'package:pill_detection/models/history_interact_model.dart';
import 'package:pill_detection/models/interact_model.dart';

import '../../../models/detect_models/pill_detect_model.dart';
import '../../../models/history_D_model.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryInteractionLoading extends HistoryState {}

class HistoryInteractionSuccess extends HistoryState {
  final InteractionHistoryModel interactionHistoryModel;

  HistoryInteractionSuccess({required this.interactionHistoryModel});
}

class HistoryInteractionFailure extends HistoryState {
  final String errorMessage;

  HistoryInteractionFailure({required this.errorMessage});
}

class HistoryDetectLoading extends HistoryState {}

class HistoryDetectSuccess extends HistoryState {
  final AllDetectionHistoryModel detectionHistoryModel;

  HistoryDetectSuccess({required this.detectionHistoryModel});
}

class HistoryDetectFailure extends HistoryState {
  final String errorMessage;

  HistoryDetectFailure({required this.errorMessage});
}

class ChangeFilteredGroupState extends HistoryState {}

class ChangeFilteredIGroupState extends HistoryState {}

class SDetectHistorySuccessState extends HistoryState {
  final PillDetectModel detectModel;

  SDetectHistorySuccessState({required this.detectModel});
}

class SDetectHistoryFailureState extends HistoryState {
  final String errorMessage;

  SDetectHistoryFailureState({required this.errorMessage});
}

class SDetectHistoryLoading extends HistoryState {}

class SInteractHistorySuccessState extends HistoryState {
  final DataModel dataModel;

  SInteractHistorySuccessState({required this.dataModel});
}

class SInteractHistoryFailureState extends HistoryState {
  final String errorMessage;

  SInteractHistoryFailureState({required this.errorMessage});
}

class SInteractHistoryLoading extends HistoryState {}

class DeleteDHistoryLoading extends HistoryState {}

class DeleteDHistorySuccess extends HistoryState {}

class DeleteDHistoryFailure extends HistoryState {
  final String errorMessage;

  DeleteDHistoryFailure({required this.errorMessage});
}

class DeleteIHistoryLoading extends HistoryState {}

class DeleteIHistorySuccess extends HistoryState {}

class DeleteIHistoryFailure extends HistoryState {
  final String errorMessage;

  DeleteIHistoryFailure({required this.errorMessage});
}
