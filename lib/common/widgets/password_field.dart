import 'package:flutter/material.dart';
import 'package:medical/common/utils/kcolors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.radius = 4.0,
    this.backgroundColor = Kolors.kPrimaryLight,
    required this.showBorder,
  });

  final TextEditingController controller;
  final String hintText;
  final double radius;
  final Color backgroundColor;
  final bool showBorder;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible, // Cache le texte en fonction de l'état.
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
            color: widget.showBorder ? Colors.blue.shade900 : Colors.transparent,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.showBorder ? Colors.blue.shade800 : Colors.transparent,
            width: 1.0,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, // Changer d'icône en fonction de l'état.
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible; // Inverser l'état de visibilité.
            });
          },
        ),
      ),
    );
  }
}
