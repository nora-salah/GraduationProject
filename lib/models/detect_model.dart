import '../core/database/api/end_point.dart';
import 'detect_opttions_model.dart';

class PillDetectResponseModel {
  final PillDetectModel data;

  PillDetectResponseModel({required this.data});

  factory PillDetectResponseModel.fromJson(Map<String, dynamic> json) {
    return PillDetectResponseModel(
      data: PillDetectModel.fromJson(json['data']),
    );
  }
}

class PillDetectModel {
  final String message;
  final int id;
  final String name;
  final String photo;
  final String description;
  final List<DosageDetectModel> dosages;
  final List<SideEffectDetectModel> sideEffects;
  final List<ContraindicationModel> contraindications;

  PillDetectModel({
    required this.message,
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.dosages,
    required this.sideEffects,
    required this.contraindications,
  });

  factory PillDetectModel.fromJson(Map<String, dynamic> json) {
    return PillDetectModel(
      message: json[Apikeys.message],
      id: json[Apikeys.id],
      name: json[Apikeys.name],
      photo: json[Apikeys.photo],
      description: json[Apikeys.description],
      dosages: (json[Apikeys.dosages] as List)
          .map((dosageJson) => DosageDetectModel.fromJson(dosageJson))
          .toList(),
      sideEffects: (json[Apikeys.sideEffects] as List)
          .map((sideEffectJson) =>
              SideEffectDetectModel.fromJson(sideEffectJson))
          .toList(),
      contraindications: (json[Apikeys.contraindiacations] as List)
          .map((contraindicationJson) =>
              ContraindicationModel.fromJson(contraindicationJson))
          .toList(),
    );
  }
}

/*
class PillDetectModel {
  final int id;
  final String name;
  final String photo;
  final String description;

  PillDetectModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
  });

  factory PillDetectModel.fromJson(Map<String, dynamic> jsonData) {
    return PillDetectModel(
      id: jsonData['data'][Apikeys.id],
      name: jsonData['data'][Apikeys.name],
      photo: jsonData['data'][Apikeys.profilePic],
      description: jsonData['data'][Apikeys.description],
    );
  }
}
*/
