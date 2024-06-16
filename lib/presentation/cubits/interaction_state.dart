import 'package:pill_detection/models/interact_model.dart';

abstract class InteractionState {}

class InteractionInitial extends InteractionState {}

class ChangeItemState extends InteractionState {}

class ChangeItemState3 extends InteractionState {}

class ChangeItemState2 extends InteractionState {}

class GetAllPillsLoading extends InteractionState {}

class GetAllPillsSuccess extends InteractionState {}

class GetAllPillFailed extends InteractionState {
  final String errorMessage;
  GetAllPillFailed({required this.errorMessage});
}

class InteractionLoading extends InteractionState {}

class InteractionSuccess extends InteractionState {
  final AllData dataModel;
  InteractionSuccess({required this.dataModel});
}

class InteractionFailed extends InteractionState {
  final String errorMessage;
  InteractionFailed({required this.errorMessage});
}

class InteractionImageLoading extends InteractionState {}

class InteractionImageSuccess extends InteractionState {
  final AllData dataModelImages;
  InteractionImageSuccess({required this.dataModelImages});
}

class InteractionImageFailed extends InteractionState {
  final String errorMessage;
  InteractionImageFailed({required this.errorMessage});
}

class ChangeImageState2 extends InteractionState {}

class ChangeImageState extends InteractionState {}
