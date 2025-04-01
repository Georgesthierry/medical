import 'dart:convert';

// Function to create RegistrationModel object from a JSON string
RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

// Function to convert RegistrationModel object to a JSON string
String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  // Required fields
  String? email;
  String? fullName;
  String? phone;
  String? password;
  String? birthday;

  // Constructor with required fields and optional named parameters
  RegistrationModel({
    this.email,
    this.fullName,
    this.phone,
    this.password,
    this.birthday,
  });

  // Factory method to create an object from a JSON map
  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(

        email: json["email"],
        fullName: json["full_name"],
        phone: json["phone"],
        password: json["password"],
        birthday: json["birthday"],
      );

  // Method to convert an object to a JSON map
  Map<String, dynamic> toJson() => {
    "email": email,
    "full_name": fullName,
    "phone": phone,
    "password": password,
    "birthday": birthday,
  };
}
