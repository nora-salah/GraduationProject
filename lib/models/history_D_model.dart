import 'dart:ffi';

import '../core/database/api/end_point.dart';

class AllDetectionHistoryModel {
  final List<DHistory> dHistory;

  AllDetectionHistoryModel({required this.dHistory});

  factory AllDetectionHistoryModel.fromJson(Map<String, dynamic> jsonData) {
    return AllDetectionHistoryModel(
      dHistory: (jsonData[Apikeys.data] as List<dynamic>)
          .map((e) => DHistory.fromJson(e))
          .toList(),
    );
  }
}

class DHistory {
  final int id;
  final int pillId;

  final String pillName;
  final String createdAt;
  final String pillPhoto;
  final String userPhoto;

  DHistory({
    required this.id,
    required this.pillId,
    required this.pillName,
    required this.createdAt,
    required this.pillPhoto,
    required this.userPhoto,
  });

  factory DHistory.fromJson(Map<String, dynamic> jsonData) {
    return DHistory(
      pillId: jsonData[Apikeys.pillId],
      pillName: jsonData[Apikeys.pillName],
      id: jsonData[Apikeys.id],
      pillPhoto: jsonData[Apikeys.pillPhoto],
      userPhoto: jsonData[Apikeys.userPillPhoto],
      createdAt: jsonData[Apikeys.createdAt],
    );
  }
}
