import 'dart:convert';

// Function to create ProfileModel object from a JSON string

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String id;
  String username;
  String fullName;
  String email;
  String firstName;
  String lastName;
  String phone;
  String profilePicture;
  String birthday;

  // Constructor with required fields and optional named parameters
  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.fullName,
    required this.lastName,
    required this.phone,
    required this.profilePicture,
    required this.birthday,
  });

  // Factory method to create an object from a JSON map
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"] ?? '',
    username: json["username"] ?? '',
    email: json["email"] ?? '',
    fullName: json["full_name"] ?? '',
    firstName: json["first_name"] ?? '',
    lastName: json["last_name"] ?? '',
    phone: json["phone"] ?? '',
    profilePicture: json["profile_picture"] ?? '',
    birthday: json["birthday"] ?? '',
  );

  // Method to convert an object to a JSON map
  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "full_name": fullName,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "profile_picture": profilePicture,
    "birthday": birthday,
  };
}
