import 'package:flutter/material.dart';

const labelStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class GenderContent extends StatelessWidget {
  GenderContent({this.icon, this.label});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 8.0),
        Text(label, style: labelStyle)
      ],
    );
  }
}
