class SideEffect {
  int? id;
  String? sideEffect;
  int? pillId;

  SideEffect({
    this.id,
    this.sideEffect,
    this.pillId,
  });

  factory SideEffect.fromJson(Map<String, dynamic> json) => SideEffect(
        id: json['id'] as int?,
        sideEffect: json['side_effect'] as String?,
        pillId: json['pill_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'side_effect': sideEffect,
        'pill_id': pillId,
      };
}
