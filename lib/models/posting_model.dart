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

 PostingModel({this.id = "", this.name = "", this.type, this.price = 0, this.description = "", this.address = "", this.city = "", this.country = "", this.host = ""})
 {
   
 }

}