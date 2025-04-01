import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical/common/services/storage.dart';
import 'package:medical/common/widgets/error_modal.dart';
import 'package:medical/src/doctors/models/doctor_models.dart';

class DoctorNotifier with ChangeNotifier {
  List<DoctorModel> _doctors = [];
  List<DoctorModel> _filteredDoctors = [];
  List<DoctorModel> _favoriteDoctors = [];
  DoctorModel? _selectedDoctor;
  bool _isLoading = false;
  String _currentFilter = "All"; // Filtre actuel

  // Getters
  List<DoctorModel> get doctors => _filteredDoctors;
  List<DoctorModel> get favoriteDoctors => _favoriteDoctors;
  DoctorModel? get selectedDoctor => _selectedDoctor;
  bool get isLoading => _isLoading;
  String get currentFilter => _currentFilter;

  void _setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }

  /// Récupérer tous les médecins
  Future<void> fetchDoctors(BuildContext context) async {
    _setLoading(true);
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse('http://10.0.2.2:8000/api/doctors/');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 200) {
        _doctors = List<DoctorModel>.from(
          jsonDecode(response.body).map((x) => DoctorModel.fromJson(x)),
        );
        _applyFilter(); // Appliquer le filtre initial
      } else {
        _handleError(context, response, "Erreur lors du chargement des médecins");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
    _setLoading(false);
  }

  /// Appliquer un filtre
  void setFilter(String filter) {
    _currentFilter = filter;
    _applyFilter();
    notifyListeners();
  }

  /// Appliquer le filtre en fonction du critère
  void _applyFilter() {
    _filteredDoctors = List.from(_doctors); // Réinitialisation

    switch (_currentFilter) {
      case "A-Z":
        _filteredDoctors.sort((a, b) => a.fullName.compareTo(b.fullName));
        break;

      case "Best":
        _filteredDoctors =
            _filteredDoctors.where((doctor) => doctor.rating > 4).toList();
        break;

      case "Favorites":
        _filteredDoctors =
            _filteredDoctors.where((doctor) => doctor.isFavorite).toList();
        break;

      case "Male":
        _filteredDoctors =
            _filteredDoctors.where((doctor) => doctor.gender == "Male").toList();
        break;

      case "Female":
        _filteredDoctors = _filteredDoctors
            .where((doctor) => doctor.gender == "Female")
            .toList();
        break;

      default:
        break;
    }
  }

  /// Obtenir les détails d'un médecin par son ID
  Future<void> fetchDoctorById(BuildContext context, int doctorId) async {
    _setLoading(true);
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse("http://10.0.2.2:8000/api/doctors/$doctorId/");

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 200) {
        _selectedDoctor = DoctorModel.fromJson(jsonDecode(response.body));
      } else {
        _handleError(context, response, "Erreur lors du chargement du médecin");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
    _setLoading(false);
  }

  /// Ajouter un docteur aux favoris
  Future<void> addToFavorites(BuildContext context, DoctorModel doctor) async {
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse("http://10.0.2.2:8000/api/doctors/${doctor.id}/favorite/");

      final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        if (!_favoriteDoctors.any((d) => d.id == doctor.id)) {
          _favoriteDoctors.add(doctor);
          notifyListeners();
        }
      } else {
        _handleError(context, response, "Erreur lors de l'ajout en favori");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
  }

  /// Supprimer un docteur des favoris
  Future<void> removeFromFavorites(BuildContext context, int doctorId) async {
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse("http://10.0.2.2:8000/api/doctors/$doctorId/favorite/");

      final response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 204) {
        _favoriteDoctors.removeWhere((doctor) => doctor.id == doctorId);
        notifyListeners();
      } else {
        _handleError(context, response, "Erreur lors de la suppression");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
  }

  /// Récupérer les médecins favoris
  Future<void> fetchFavoriteDoctors(BuildContext context) async {
    _setLoading(true);
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse('http://10.0.2.2:8000/api/doctors/favorites/');

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 200) {
        _favoriteDoctors = List<DoctorModel>.from(
          jsonDecode(response.body).map((x) => DoctorModel.fromJson(x)),
        );
      } else {
        _handleError(context, response, "Erreur lors du chargement des favoris");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
    _setLoading(false);
  }

  /// Vérifier si un docteur est favori
  bool isFavorite(int doctorId) {
    return _favoriteDoctors.any((doctor) => doctor.id == doctorId);
  }

  /// Gérer les erreurs des réponses HTTP
  void _handleError(BuildContext context, http.Response response, String defaultMessage) {
    try {
      final data = jsonDecode(response.body);
      final message = data['error'] ?? defaultMessage;
      showErrorPopup(context, message, null, null);
    } catch (e) {
      showErrorPopup(context, defaultMessage, e.toString(), null);
    }
  }
}
