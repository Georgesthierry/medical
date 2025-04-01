import 'dart:convert';

AvailabilityModel availabilityModelFromJson(String str) => AvailabilityModel.fromJson(json.decode(str));

String availabilityModelToJson(AvailabilityModel data) => json.encode(data.toJson());

class AvailabilityModel {
  int? id;
  int? doctorId;
  List<String> days;
  String startTime;
  String endTime;

  AvailabilityModel({
    this.id,
    this.doctorId,
    required this.days,
    required this.startTime,
    required this.endTime,
  });

  // Convertir un JSON en objet AvailabilityModel
  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => AvailabilityModel(
    id: json["id"],
    doctorId: json["doctor"],
    days: List<String>.from(json["days"].map((x) => x)),
    startTime: json["start_time"],
    endTime: json["end_time"],
  );

  // Convertir un objet AvailabilityModel en JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor": doctorId,
    "days": List<dynamic>.from(days.map((x) => x)),
    "start_time": startTime,
    "end_time": endTime,
  };
}
