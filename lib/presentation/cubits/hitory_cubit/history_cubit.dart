import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pill_detection/models/interact_model.dart';

import '../../../models/detect_models/pill_detect_model.dart';
import '../../../models/history_D_model.dart';
import '../../../models/history_interact_model.dart';
import '../../../repositories/history_repo.dart';
import '../detect_cubit/detect_state.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.historyRepo) : super(HistoryInitial());
  List<IHistory> allIHistory = [];
  HistoryRepo? historyRepo;
  List<DHistory> allDHistory = [];
  DHistory? detectHistory;

  TextEditingController searchController = TextEditingController();
  void getAllIHistory() async {
    emit(HistoryInteractionLoading());
    final response = await historyRepo!.getAllIHistory();
    response.fold(
      (errMessage) {
        emit(HistoryInteractionFailure(errorMessage: errMessage));
      },
      (interactHistoryModel) {
        allIHistory = interactHistoryModel.iHistory;
        emit(HistoryInteractionSuccess(
            interactionHistoryModel: interactHistoryModel));
      },
    );
  }

  void getAllDHistory() async {
    emit(HistoryDetectLoading());
    final response = await historyRepo!.getAllDHistory();
    response.fold(
      (errMessage) {
        emit(HistoryDetectFailure(errorMessage: errMessage));
      },
      (detectionHistoryModel) {
        allDHistory = detectionHistoryModel.dHistory;
        emit(
            HistoryDetectSuccess(detectionHistoryModel: detectionHistoryModel));
      },
    );
  }

  late List iHistoryList = allIHistory;

  late List dHistoryList = allDHistory;
  void filteredDetectSearch(String value) {
    if (value.isEmpty) {
      dHistoryList = allDHistory;
    } else {
      dHistoryList = allDHistory
          .where(
            (element) => element.pillName
                .toString()
                .toLowerCase()
                .contains(value.toLowerCase()),
          )
          .toList();
    }
    emit(ChangeFilteredGroupState());
  }

  PillDetectModel? detectDataModel;
  DataModel? interactDataModel;
  void getSpecificDHistory(pillId) async {
    emit(SDetectHistoryLoading());
    final response = await historyRepo!.getSpecificDHistory(id: pillId);

    response.fold(
        (errorMessage) =>
            emit(SDetectHistoryFailureState(errorMessage: errorMessage)),
        (pillDetectModel) {
      detectDataModel = pillDetectModel;
      emit(SDetectHistorySuccessState(detectModel: pillDetectModel));
    });
  }

  void getSpecificIHistory(pillId) async {
    emit(SInteractHistoryLoading());
    final response = await historyRepo!.getSpecificIHistory(id: pillId);

    response.fold(
        (errorMessage) =>
            emit(SInteractHistoryFailureState(errorMessage: errorMessage)),
        (pillinteractModel) {
      interactDataModel = pillinteractModel;
      emit(SInteractHistorySuccessState(dataModel: pillinteractModel));
    });
  }

  void deleteSpecificDHistory(id) async {
    emit(DeleteDHistoryLoading());
    final response = await historyRepo!.deleteDHistory(id: id);

    response.fold(
        (errorMessage) =>
            emit(DeleteDHistoryFailure(errorMessage: errorMessage)), (l) {
      dHistoryList.removeWhere((item) => item.id == id);
      emit(DeleteDHistorySuccess());
    });
  }

  void deleteSpecificIHistory(id) async {
    emit(DeleteIHistoryLoading());
    final response = await historyRepo!.deleteIHistory(id: id);

    response.fold(
        (errorMessage) =>
            emit(DeleteIHistoryFailure(errorMessage: errorMessage)), (l) {
      iHistoryList.removeWhere((item) => item.id == id);
      emit(DeleteIHistorySuccess());
    });
  }
}
