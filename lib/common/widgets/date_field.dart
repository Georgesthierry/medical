import 'package:flutter/material.dart';
import 'package:medical/common/utils/kcolors.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.backgroundColor = Kolors.kPrimaryLight,
    this.radius = 8.0,
    this.showBorder = true,
  });

  final TextEditingController controller;
  final String hintText;
  final Color backgroundColor;
  final double radius;
  final bool showBorder;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true, // Empêche la saisie manuelle pour forcer l'utilisation du sélecteur.
      onTap: () async {
        // Affiche le sélecteur de date lorsque le champ est pressé.
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000), // Date minimale autorisée.
          lastDate: DateTime(2100), // Date maximale autorisée.
        );

        if (pickedDate != null) {
          // Formate et définit la date choisie.
          setState(() {
            widget.controller.text = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
          });
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.backgroundColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.showBorder ? Colors.transparent : Colors.transparent,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.showBorder ? Colors.transparent : Colors.transparent,
            width: 1.0,
          ),
        ),
        suffixIcon: const Icon(Icons.calendar_today), // Icône de calendrier.
      ),
    );
  }
}
