import 'data.dart';

class PillDetectModel {
	Data? data;

	PillDetectModel({this.data});

	factory PillDetectModel.fromJson(Map<String, dynamic> json) {
		return PillDetectModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
