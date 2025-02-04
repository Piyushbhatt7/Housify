import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

 getAllImagesFromStorage() async
 {
    displayImage = [];
    for(int i = 0; i < imageName!.length; i++)
    {
      final imageData = await FirebaseStorage.instance.ref()
      .child("postingImages")
      .child(id!)
      .child(imageName![i])
      .getData(1024 * 1024);

      displayImage!.add(MemoryImage(imageData!));
    }

    return displayImage;
 }

 getFirstImageFromStorage () async
 {
    if(displayImage!.isNotEmpty)
    {
      return displayImage!.first;
    }

    final imageData = await FirebaseStorage.instance.ref()
      .child("postingImages")
      .child(id!)
      .child(imageName!.first)
      .getData(1024 * 1024);

      displayImage!.add(MemoryImage(imageData!));

      return displayImage!.first;
 }

 getAmenitiesString()
 {
   if(amenities!.isEmpty)
   {
    return "";
   }

   String amenitiesString = amenities.toString();

   return amenitiesString.substring(1, amenitiesString.length-1);
 }

  double getCurrentRating () 
 {
   if(reviews!.length == 0)
   {
    return 4;
   }

   double rating = 0;

   reviews!.forEach((reviews)
   {
      rating += reviews.rating!;
   });

   rating = rating / reviews!.length;

   return rating;

 }

 getHostFromFirestore() async
 {
   await host!.getContactInfoFromFirestore();
   await host!.getImageFromStorage();
 }

 int getGuestNumber()
 {
   int? numGuests = 0;
   numGuests = numGuests + beds!['small']!;
   numGuests = numGuests + beds!['medium']! *2;
   numGuests = numGuests + beds!['large']! *2;

   return numGuests;
 }


 String getBedroomsText()
 {
  String text = "";

  if(this.beds!["small"] != 0)
  {
    text = text + beds!["small"].toString() + " single/twin";
  }

   
   if(this.beds!["medium"] != 0)
  {
    text = text + beds!["medium"].toString() + " double";
  }

  if(this.beds!["large"] != 0)
  {
    text = text + beds!["large"].toString() + " queen/king";
  }
 }
 
} 