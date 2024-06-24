import '../core/database/api/end_point.dart';

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
