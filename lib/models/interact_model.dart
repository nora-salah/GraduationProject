class AllData {
  List<DataModel> data;

  AllData({
    required this.data,
  });
  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        data: List<DataModel>.from(
            json["data"].map((x) => DataModel.fromJson(x))),
      );
}

class DataModel {
  final String message;
  final int id;
  final String interactionType;
  final String interactionDescription;
  final String guides;
  final PillDataModel pill1;
  final PillDataModel pill2;
  DataModel({
    required this.message,
    required this.id,
    required this.interactionType,
    required this.interactionDescription,
    required this.guides,
    required this.pill1,
    required this.pill2,
  });

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      message: jsonData['message'],
      id: jsonData['id'],
      interactionType: jsonData['interaction_type'],
      interactionDescription: jsonData['interaction_description'],
      guides: jsonData['guides'],
      pill1: PillDataModel.fromJson(jsonData['pill1']),
      pill2: PillDataModel.fromJson(jsonData['pill2']),
    );
  }
}

class PillDataModel {
  final int id;
  final String name;
  final String photo;
  final String description;

  PillDataModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
  });

  factory PillDataModel.fromJson(Map<String, dynamic> jsonData) {
    return PillDataModel(
      id: jsonData['id'],
      name: jsonData['name'],
      photo: jsonData['photo'],
      description: jsonData['description'],
    );
  }
}
