import 'package:flutter/material.dart';
import 'package:housify/models/contact_model.dart';

class PostingModel {

  String? id;
  String? name;
  String? type;
  String? price;
  String? description;
  String? address;
  String? city;
  String? country;
  double? rating;

  ContactModel? host;

  List<String>? imageName;
  List<MemoryImage>? displayImage;
  List<String>? amenities;

  Map<String, int>? beds;
 Map<String, int>? bathrooms;

 PostingModel

}