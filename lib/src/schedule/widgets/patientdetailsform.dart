import 'package:flutter/material.dart';

class PatientDetailsForm extends StatefulWidget {
  @override
  _PatientDetailsFormState createState() => _PatientDetailsFormState();
}

class _PatientDetailsFormState extends State<PatientDetailsForm> {
  int selectedPerson = 0; // 0 -> Yourself, 1 -> Another Person
  int selectedGender = 1; // 0 -> Male, 1 -> Female, 2 -> Other

  final TextEditingController _fullNameController =
  TextEditingController(text: "Jane Doe");
  final TextEditingController _ageController = TextEditingController(text: "30");
  final TextEditingController _problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Patient Details"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Boutons Yourself / Another Person
            Text("Patient Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ToggleButtons(
              borderRadius: BorderRadius.circular(20),
              borderColor: Colors.blue,
              selectedBorderColor: Colors.blue,
              fillColor: Colors.blue,
              color: Colors.blue,
              selectedColor: Colors.white,
              isSelected: [selectedPerson == 0, selectedPerson == 1],
              onPressed: (index) {
                setState(() {
                  selectedPerson = index;
                });
              },
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text("Yourself")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text("Another Person")),
              ],
            ),
            SizedBox(height: 20),

            // Nom complet
            Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: "Enter Full Name",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Âge
            Text("Age", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.blue.shade50,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),

            // Sexe
            Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
            ToggleButtons(
              borderRadius: BorderRadius.circular(20),
              borderColor: Colors.blue,
              selectedBorderColor: Colors.blue,
              fillColor: Colors.blue,
              color: Colors.blue,
              selectedColor: Colors.white,
              isSelected: [selectedGender == 0, selectedGender == 1, selectedGender == 2],
              onPressed: (index) {
                setState(() {
                  selectedGender = index;
                });
              },
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text("Male")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text("Female")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text("Other")),
              ],
            ),
            SizedBox(height: 20),

            // Description du problème
            Text("Describe your problem", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _problemController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter Your Problem Here...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
