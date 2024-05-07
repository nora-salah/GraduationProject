import '../core/database/api/end_point.dart';

class GetAllPillsModel {
  final String message;
  final List<PillModel> pills;

  GetAllPillsModel({required this.message, required this.pills});

  factory GetAllPillsModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllPillsModel(
      message: jsonData[Apikeys.message],
      pills: (jsonData[Apikeys.data] as List<dynamic>)
          .map((e) => PillModel.fromJson(e))
          .toList(),
    );
  }
}

class PillModel {
  final String name;
  PillModel({
    required this.name,
  });
  factory PillModel.fromJson(Map<String, dynamic> jsonData) {
    return PillModel(
      name: jsonData[Apikeys.name],
    );
  }
}
