import 'package:flutter/material.dart';
import 'package:housify/models/contact_model.dart';

class PostingModel {

  String? id;
  String? name;
  String? type;
  double? price;
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

  List<Booking>? bookings;

 PostingModel({this.id = "", this.name = "", this.type, this.price = 0, this.description = "", this.address = "", this.city = "", this.country = "", this.host})
 {
     displayImage = [];
     amenities = [];


     beds = {};
     bathrooms = {};
     rating = 0;
 }

 setImagesNames()
 {
  imageName = [];
  
  for(int i = 0; i < displayImage!.length; i++)
  {
     imageName!.add("image${i}.png");
  }
 }

}