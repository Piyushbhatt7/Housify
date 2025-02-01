import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housify/models/booking_model.dart';
import 'package:housify/models/contact_model.dart';
import 'package:housify/models/review_model.dart';

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

  List<BookingModel>? bookings;
  List<ReviewModel>? reviews;

 PostingModel({this.id = "", this.name = "", this.type, this.price = 0, this.description = "", this.address = "", this.city = "", this.country = "", this.host})
 {
     displayImage = [];
     amenities = [];


     beds = {};
     bathrooms = {};
     rating = 0;

     bookings = [];
     reviews = [];
 }

 setImagesNames()
 {
  imageName = [];
  
  for(int i = 0; i < displayImage!.length; i++)
  {
     imageName!.add("image${i}.png");
  }
 }

 getMyPostingFromFirestore() async
 {
   DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('postings').doc(id).get();

   getMyPostingFromSnapshot(snapshot);
 }
 
 getMyPostingFromSnapshot(DocumentSnapshot snapshot)
 {
   address = snapshot['address'] ?? "";
   amenities = List<String>.from(snapshot['amenities']) ?? [];
   bathrooms = Map<String, int>.from(snapshot['bathrooms']) ?? {};
   beds = Map<String, int>.from(snapshot['beds']) ?? {};
   city = snapshot['city'] ?? "";
   country = snapshot['country'] ?? "";
   description = snapshot['description'] ?? "";

   String hostID = snapshot['hostID'] ?? "";
   host = ContactModel(id: hostID);

   imageName = List<String>.from(snapshot['imagesNames']) ?? [];
   name = snapshot['names'] ?? "";
   price = snapshot['price'].toDouble() ?? 0.0;
   rating = snapshot['rating'].toDouble() ?? 2.5;
   type = snapshot['type'] ?? "";
 }

}