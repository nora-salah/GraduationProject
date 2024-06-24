class Contraindiacation {
  int? id;
  String? contraindiacation;
  int? pillId;

  Contraindiacation({
    this.id,
    this.contraindiacation,
    this.pillId,
  });

  factory Contraindiacation.fromJson(Map<String, dynamic> json) {
    return Contraindiacation(
      id: json['id'] as int?,
      contraindiacation: json['contraindication'] as String?,
      pillId: json['pill_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'contraindication': contraindiacation,
        'pill_id': pillId,
      };
}
