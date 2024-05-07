import '../../core/database/api/end_point.dart';

class Dosage {
  int? id;
  String? dosage;
  int? pillId;

  Dosage({
    this.id,
    this.dosage,
    this.pillId,
  });

  factory Dosage.fromJson(Map<String, dynamic> json) => Dosage(
        id: json['id'] as int?,
        dosage: json['dosage'] as String?,
        pillId: json['pill_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dosage': dosage,
        'pill_id': pillId,
      };
}

class DosageDetectModel {
  final int id;
  final String dosage;
  final int pillId;

  DosageDetectModel({
    required this.id,
    required this.dosage,
    required this.pillId,
  });

  factory DosageDetectModel.fromJson(Map<String, dynamic> json) {
    return DosageDetectModel(
      id: json[Apikeys.id],
      dosage: json[Apikeys.dosage],
      pillId: json[Apikeys.pillId],
    );
  }
}

class SideEffectDetectModel {
  final int id;
  final String sideEffect;
  final int pillId;

  SideEffectDetectModel({
    required this.id,
    required this.sideEffect,
    required this.pillId,
  });

  factory SideEffectDetectModel.fromJson(Map<String, dynamic> json) {
    return SideEffectDetectModel(
      id: json[Apikeys.id],
      sideEffect: json[Apikeys.sideEffect],
      pillId: json[Apikeys.pillId],
    );
  }
}

class ContraindicationModel {
  final int id;
  final String contraindication;
  final int pillId;
  final String? createdAt;
  final String? updatedAt;

  ContraindicationModel({
    required this.id,
    required this.contraindication,
    required this.pillId,
    this.createdAt,
    this.updatedAt,
  });

  factory ContraindicationModel.fromJson(Map<String, dynamic> json) {
    return ContraindicationModel(
      id: json[Apikeys.id],
      contraindication: json[Apikeys.contraindiacations],
      pillId: json[Apikeys.pillId],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

/*
class PillDosageDetectModel {
  final int id;
  final String dosage;
  final int pillId;

  PillDosageDetectModel({
    required this.id,
    required this.dosage,
    required this.pillId,
  });

  factory PillDosageDetectModel.fromJson(Map<String, dynamic> jsonData) {
    return PillDosageDetectModel(
      id: jsonData['pilldosagedata'][0][Apikeys.id],
      dosage: jsonData['pilldosagedata'][0][Apikeys.dosage],
      pillId: jsonData['pilldosagedata'][0][Apikeys.pillId],
    );
  }
}

class SideEffectDetectModel {
  final int id;
  final String dosage;
  final int pillId;

  SideEffectDetectModel({
    required this.id,
    required this.dosage,
    required this.pillId,
  });

  factory SideEffectDetectModel.fromJson(Map<String, dynamic> jsonData) {
    return SideEffectDetectModel(
      id: jsonData['side_effectsdata'][0][Apikeys.id],
      dosage: jsonData['side_effectsdata'][0][Apikeys.sideEffect],
      pillId: jsonData['side_effectsdata'][0][Apikeys.pillId],
    );
  }
}

class ConstrainDetectModel {
  final int id;
  final String dosage;
  final int pillId;

  ConstrainDetectModel({
    required this.id,
    required this.dosage,
    required this.pillId,
  });

  factory ConstrainDetectModel.fromJson(Map<String, dynamic> jsonData) {
    return ConstrainDetectModel(
      id: jsonData['contraindiacationsdata'][0][Apikeys.id],
      dosage: jsonData['contraindiacationsdata'][0][Apikeys.contraindDetect],
      pillId: jsonData['contraindiacationsdata'][0][Apikeys.pillId],
    );
  }
}
*/
