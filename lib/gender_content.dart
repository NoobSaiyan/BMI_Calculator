import 'package:flutter/material.dart';
import 'constants.dart';

class GenderContent extends StatelessWidget {
  GenderContent({this.icon, this.label});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 70.0),
        SizedBox(height: 8.0),
        Text(label, style: labelStyle)
      ],
    );
  }
}
