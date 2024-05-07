class Contraindiacation {
  int? id;
  String? contraindiacations;
  int? pillId;

  Contraindiacation({
    this.id,
    this.contraindiacations,
    this.pillId,
  });

  factory Contraindiacation.fromJson(Map<String, dynamic> json) {
    return Contraindiacation(
      id: json['id'] as int?,
      contraindiacations: json['contraindiacations'] as String?,
      pillId: json['pill_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'contraindiacations': contraindiacations,
        'pill_id': pillId,
      };
}
