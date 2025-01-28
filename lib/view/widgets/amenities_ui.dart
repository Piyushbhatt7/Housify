import 'package:flutter/material.dart';

class AmenitiesUi extends StatefulWidget {
  
  String type;
  int startValue;
  Function decreaseValue;
  Function increaseValue;

  const AmenitiesUi({super.key, required this.type});

  @override
  State<AmenitiesUi> createState() => _AmenitiesUiState();
}

class _AmenitiesUiState extends State<AmenitiesUi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}