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

class ChangeImageState2 extends InteractionState {}

class ChangeImageState extends InteractionState {}
