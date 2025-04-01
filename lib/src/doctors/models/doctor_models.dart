import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  int? id;
  String fullName;
  String function;
  int yearsOfExperience;
  String profile;
  String careerPath;
  String highlights;
  String? photo;
  String gender;
  double rating;
  bool isBest; // Nouveau champ
  bool isFavorite; // Nouveau champ

  DoctorModel({
    this.id,
    required this.fullName,
    required this.function,
    required this.yearsOfExperience,
    required this.profile,
    required this.careerPath,
    required this.highlights,
    this.photo,
    required this.gender,
    required this.rating,
    this.isBest = false, // Valeur par défaut
    this.isFavorite = false, // Valeur par défaut
  });

  // Convertir un JSON en objet DoctorModel
  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json["id"] ?? 0,
    fullName: json["full_name"] ?? "",
    function: json["function"] ?? "",
    yearsOfExperience: json["years_of_experience"] ?? 0,
    profile: json["profile"] ?? "",
    careerPath: json["career_path"] ?? "",
    highlights: json["highlights"] ?? "",
    photo: json["photo"],
    gender: json["gender"] ?? "Unknown",
    rating: (json["rating"] != null) ? double.tryParse(json["rating"].toString()) ?? 0.0 : 0.0,
    isBest: json["is_best"] ?? false,
    isFavorite: json["is_favorite"] ?? false,
  );

  // Convertir un objet DoctorModel en JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "function": function,
    "years_of_experience": yearsOfExperience,
    "profile": profile,
    "career_path": careerPath,
    "highlights": highlights,
    "photo": photo,
    "gender": gender,
    "rating": rating,
    "is_best": isBest,
    "is_favorite": isFavorite,
  };

  // Méthode de filtrage et tri
  static List<DoctorModel> filterAndSortDoctors(
      List<DoctorModel> doctors, {
        String? function,
        int? minExperience,
        int? maxExperience,
        String? gender,
        double? minRating,
        double? maxRating,
        bool sortByName = false,
        bool ascending = true, // true = A-Z, false = Z-A
        bool? showFavorites, // Filtrer les favoris
        bool? showBest, // Filtrer les "meilleurs"
      }) {
    // Filtrage
    List<DoctorModel> filteredDoctors = doctors.where((doctor) {
      bool matchesFunction = function == null || doctor.function.toLowerCase().contains(function.toLowerCase());
      bool matchesExperience = (minExperience == null || doctor.yearsOfExperience >= minExperience) &&
          (maxExperience == null || doctor.yearsOfExperience <= maxExperience);
      bool matchesGender = gender == null || doctor.gender.toLowerCase() == gender.toLowerCase();
      bool matchesRating = (minRating == null || doctor.rating >= minRating) &&
          (maxRating == null || doctor.rating <= maxRating);
      bool matchesFavorites = showFavorites == null || doctor.isFavorite == showFavorites;
      bool matchesBest = showBest == null || doctor.isBest == showBest;

      return matchesFunction &&
          matchesExperience &&
          matchesGender &&
          matchesRating &&
          matchesFavorites &&
          matchesBest;
    }).toList();

    // Tri par ordre alphabétique
    if (sortByName) {
      filteredDoctors.sort((a, b) {
        int comparison = a.fullName.compareTo(b.fullName);
        return ascending ? comparison : -comparison; // A-Z ou Z-A
      });
    }

    return filteredDoctors;
  }
}
