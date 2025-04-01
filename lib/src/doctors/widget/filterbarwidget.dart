import 'package:flutter/material.dart';
import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:provider/provider.dart';


class FilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DoctorNotifier>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Sort By ", style: TextStyle(fontSize: 16)),
          IconButton(
            icon: Icon(Icons.sort_by_alpha_sharp, color: Colors.blue),
            onPressed: () => provider.setFilter("A-Z"),
          ),
          IconButton(
            icon: Icon(Icons.star, color: Colors.blue[300]),
            onPressed: () => provider.setFilter("Best"),
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.blue[300]),
            onPressed: () => provider.setFilter("Favorites"),
          ),
          IconButton(
            icon: Icon(Icons.male, color: Colors.blue[300]),
            onPressed: () => provider.setFilter("male"),
          ),
          IconButton(
            icon: Icon(Icons.female_outlined, color: Colors.blue[300]),
            onPressed: () => provider.setFilter("Female"),
          ),
        ],
      ),
    );
  }
}