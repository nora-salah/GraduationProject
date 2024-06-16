import 'contraindiacation.dart';
import 'dosage.dart';
import 'side_effect.dart';

class Data {
  String? message;
  int? id;
  String? name;
  String? photo;
  String? description;
  List<Dosage>? dosages;
  List<SideEffect>? sideEffects;
  List<Contraindiacation>? contraindiacations;

  Data({
    this.message,
    this.id,
    this.name,
    this.photo,
    this.description,
    this.dosages,
    this.sideEffects,
    this.contraindiacations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json['message'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        photo: json['photo'] as String?,
        description: json['description'] as String?,
        dosages: (json['dosages'] as List<dynamic>?)
            ?.map((e) => Dosage.fromJson(e as Map<String, dynamic>))
            .toList(),
        sideEffects: (json['sideEffects'] as List<dynamic>?)
            ?.map((e) => SideEffect.fromJson(e as Map<String, dynamic>))
            .toList(),
        contraindiacations: (json['contraindiacations'] as List<dynamic>?)
            ?.map((e) => Contraindiacation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'id': id,
        'name': name,
        'photo': photo,
        'description': description,
        'dosages': dosages?.map((e) => e.toJson()).toList(),
        'sideEffects': sideEffects?.map((e) => e.toJson()).toList(),
        'contraindiacations':
            contraindiacations?.map((e) => e.toJson()).toList(),
      };
}
