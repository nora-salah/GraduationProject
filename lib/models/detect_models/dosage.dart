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
