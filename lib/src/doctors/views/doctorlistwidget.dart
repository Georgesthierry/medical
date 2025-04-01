import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/src/doctors/views/doctors_list.dart';
import 'package:medical/src/favorites/views/doctor_favorite.dart';
import 'package:medical/src/female/views/female_doctor_screen.dart';
import 'package:medical/src/male/views/male_doctors_screen.dart';
import 'package:medical/src/rating/views/rating_screen.dart';
import 'package:provider/provider.dart';
import '../controlleur/doctor_controller.dart';

class DoctorList extends StatefulWidget {
  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  String _activeFilter = "All";
  @override
  void initState() {
    super.initState();
    // Récupérer la liste des médecins au chargement du widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorNotifier>(context, listen: false).fetchDoctors(context);
    });
  }

  Widget _buildContent() {
    // Affiche différents widgets en fonction du filtre actif
    switch (_activeFilter) {
      case "A-Z":
        return DoctorsList();
      case "Best":
        return RatingScreen();
      case "Favorites":
        return DoctorFavorite();
      case "Male":
        return MaleDoctorsScreen();
      case "Female":
        return FemaleDoctorScreen();
      default:
        return DoctorsList();
    }
  }

  Widget _buildFilterButton(String filterType, IconData icon) {
    bool isSelected = _activeFilter == filterType;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeFilter = filterType;
        });
      },
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,  // Fond bleu si sélectionné
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.blue[300], // Icône blanche si sélectionnée
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Sort By ", style: TextStyle(fontSize: 16)),

                // Tri alphabétique (A-Z)
                _buildFilterButton("A-Z", Icons.sort_by_alpha_sharp),

                // Tri par note (Best)
                _buildFilterButton("Best", Icons.star),

                // Favoris
                _buildFilterButton("Favorites", Icons.favorite),

                // Genre Masculin
                _buildFilterButton("Male", Icons.male),

                // Genre Féminin
                _buildFilterButton("Female", Icons.female_outlined),
              ],
            ),
          ),
          Expanded(
            child: _buildContent(), // Afficher le contenu correspondant
          ),
        ],
      ),
    );
  }
}
