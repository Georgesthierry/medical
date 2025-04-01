import 'package:flutter/widgets.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: 12,
      textAlign: TextAlign.start,
      softWrap: true,
      style: style,);
  }
}