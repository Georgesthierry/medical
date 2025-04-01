import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical/common/services/storage.dart';
import 'package:medical/src/doctors/models/doctor_models.dart';


class FavoritesNotifier extends ChangeNotifier {
  List<DoctorModel> _favoriteDoctors = [];
  bool _isLoading = false;

  List<DoctorModel> get favoriteDoctors => _favoriteDoctors;
  bool get isLoading => _isLoading;

  /// Récupérer les favoris
  Future<void> fetchFavoriteDoctors(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      String? token = Storage().getString('accessToken');
      var url = Uri.parse('http://10.0.2.2:8000/api/favorites/');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 200) {
        _favoriteDoctors = List<DoctorModel>.from(
          jsonDecode(response.body).map((x) => DoctorModel.fromJson(x)),
        );
      } else {
        throw Exception("Erreur lors du chargement des favoris");
      }
    } catch (e) {
      print("Erreur : $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Ajouter un favori
  Future<void> addToFavorites(int doctorId) async {
    try {
      // Ajouter localement avant l'appel API
      if (!_favoriteDoctors.any((doctor) => doctor.id == doctorId)) {
        _favoriteDoctors.add(
          DoctorModel(
            id: doctorId,
            fullName: "", // Nom temporaire (vous pouvez récupérer les données complètes plus tard)
            function: '',
            yearsOfExperience: 0,
            profile: '',
            careerPath: '',
            highlights: '', gender: '', rating: 0,
          ),
        );
        notifyListeners();
      }

      String? token = Storage().getString('accessToken');
      final url = Uri.parse("http://10.0.2.2:8000/api/favorites/$doctorId/");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      );

      if (response.statusCode != 201 && response.statusCode != 200) {
        // Si l'appel API échoue, retirer l'élément ajouté localement
        _favoriteDoctors.removeWhere((doctor) => doctor.id == doctorId);
        notifyListeners();
        throw Exception("Erreur lors de l'ajout en favori");
      }
    } catch (e) {
      print("Erreur : $e");
    }
  }

  /// Supprimer un favori
  Future<void> removeFromFavorites(int doctorId) async {
    try {
      // Retirer localement avant l'appel API
      _favoriteDoctors.removeWhere((doctor) => doctor.id == doctorId);
      notifyListeners();

      String? token = Storage().getString('accessToken');
      final url = Uri.parse("http://10.0.2.2:8000/api/favorites/$doctorId/");

      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      );

      if (response.statusCode != 204) {
        // Si l'appel API échoue, restaurer l'élément supprimé localement
        _favoriteDoctors.add(
          DoctorModel(
            id: doctorId,
            fullName: "", // Valeur temporaire
            function: '',
            yearsOfExperience: 0,
            profile: '',
            careerPath: '',
            highlights: '', gender: '', rating: 0,
          ),
        );
        notifyListeners();
        throw Exception("Erreur lors de la suppression du favori");
      }
    } catch (e) {
      print("Erreur : $e");
    }
  }
  /// Vérifier si un docteur est favori
  bool isFavorite(int doctorId) {
    return _favoriteDoctors.any((doctor) => doctor.id == doctorId);
  }
}
