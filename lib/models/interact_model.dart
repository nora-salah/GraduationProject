class PillModel {
  final int id;
  final String name;
  final String photo;
  final String description;

  PillModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
  });

  factory PillModel.fromJson(Map<String, dynamic> jsonData) {
    return PillModel(
      id: jsonData['id'],
      name: jsonData['name'],
      photo: jsonData['photo'],
      description: jsonData['description'],
    );
  }
}

class InteractionModel {
  final int id;
  final String interactionType;
  final String interactionDescription;
  final String guides;
  final PillModel pill1;
  final PillModel pill2;

  InteractionModel({
    required this.id,
    required this.interactionType,
    required this.interactionDescription,
    required this.guides,
    required this.pill1,
    required this.pill2,
  });

  factory InteractionModel.fromJson(Map<String, dynamic> jsonData) {
    return InteractionModel(
      id: jsonData['id'],
      interactionType: jsonData['interaction_type'],
      interactionDescription: jsonData['interaction_description'],
      guides: jsonData['guides'],
      pill1: PillModel.fromJson(jsonData['pill1']),
      pill2: PillModel.fromJson(jsonData['pill2']),
    );
  }
}

class DataModel {
  final String message;
  final int id;
  final InteractionModel interaction;

  DataModel({
    required this.message,
    required this.id,
    required this.interaction,
  });

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      message: jsonData['message'],
      id: jsonData['id'],
      interaction: InteractionModel.fromJson(jsonData),
    );
  }
}
