import 'package:flutter/material.dart';

class AmenitiesUi extends StatefulWidget {
  
  String type;
  int startValue;
  Function decreaseValue;
  Function increaseValue;
  
 AmenitiesUi({super.key, required this.type, required this.startValue, required this.decreaseValue, required this.increaseValue});

  @override
  State<AmenitiesUi> createState() => _AmenitiesUiState();
}

class _AmenitiesUiState extends State<AmenitiesUi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}