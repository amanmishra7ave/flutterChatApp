// ignore: file_names
import 'package:flutter/material.dart';

class ReuseCode extends StatelessWidget {
  const ReuseCode({super.key, required this.onPress, this.colour, this.label});

  final VoidCallback onPress;
  final Color? colour;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
