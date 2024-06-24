import 'dart:ffi';

import '../core/database/api/end_point.dart';

class InteractionHistoryModel {
  final List<IHistory> iHistory;

  InteractionHistoryModel({required this.iHistory});

  factory InteractionHistoryModel.fromJson(Map<String, dynamic> jsonData) {
    return InteractionHistoryModel(
      iHistory: (jsonData[Apikeys.data] as List<dynamic>)
          .map((e) => IHistory.fromJson(e))
          .toList(),
    );
  }
}

class IHistory {
  final int id;

  final String interactionType;
  final String createdAt;
  final String p1Photo;
  final String p2Photo;

  IHistory({
    required this.id,
    required this.interactionType,
    required this.createdAt,
    required this.p1Photo,
    required this.p2Photo,
  });

  factory IHistory.fromJson(Map<String, dynamic> jsonData) {
    return IHistory(
      p1Photo: jsonData[Apikeys.pill1Photo],
      p2Photo: jsonData[Apikeys.pill2Photo],
      id: jsonData[Apikeys.id],
      interactionType: jsonData[Apikeys.interactionType],
      createdAt: jsonData[Apikeys.createdAt],
    );
  }
}
