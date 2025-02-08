import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<String>? imageNames;
  List<String>? imageUrls;
  List<String>? amenities;

  Map<String, int>? beds;
  Map<String, int>? bathrooms;

  List<BookingModel>? bookings;
  List<ReviewModel>? reviews;

  PostingModel({
    this.id = "",
    this.name = "",
    this.type,
    this.price = 0,
    this.description = "",
    this.address = "",
    this.city = "",
    this.country = "",
    this.host,
  }) {
    imageUrls = [];
    amenities = [];
    imageNames = [];

    beds = {};
    bathrooms = {};
    rating = 0;

    bookings = [];
    reviews = [];
  }

  /// Fetch Posting Info from Firestore
  Future<void> getPostingInfoFromFirestore() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('postings').doc(id).get();
    getPostingInfoFromSnapshot(snapshot);
  }

  /// Extract Posting Info from Firestore Snapshot
  void getPostingInfoFromSnapshot(DocumentSnapshot snapshot) {
    address = snapshot['address'] ?? "";
    amenities = List<String>.from(snapshot['amenities'] ?? []);
    bathrooms = Map<String, int>.from(snapshot['bathrooms'] ?? {});
    beds = Map<String, int>.from(snapshot['beds'] ?? {});
    city = snapshot['city'] ?? "";
    country = snapshot['country'] ?? "";
    description = snapshot['description'] ?? "";

    String hostID = snapshot['hostID'] ?? "";
    host = ContactModel(id: hostID);

    imageNames = List<String>.from(snapshot['imageNames'] ?? []);
    name = snapshot['name'] ?? "";
    price = snapshot['price']?.toDouble() ?? 0.0;
    rating = snapshot['rating']?.toDouble() ?? 2.5;
    type = snapshot['type'] ?? "";
  }

  /// Fetch all image URLs from Firebase Storage
  Future<void> fetchAllImageUrls() async {
    print("Fetching Image URLs...");
    imageUrls = [];

    try {
      for (String imageName in imageNames!) {
        String imageUrl = await FirebaseStorage.instance
            .ref()
            .child("postingImages/$id/$imageName")
            .getDownloadURL();

        imageUrls!.add(imageUrl);
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
  }

  /// Fetch the first image URL from Firebase Storage
  Future<String?> fetchFirstImageUrl() async {
    if (imageUrls!.isNotEmpty) {
      return imageUrls!.first;
    }

    if (imageNames == null || imageNames!.isEmpty) {
      return null;
    }

    try {
      return await FirebaseStorage.instance
          .ref()
          .child("postingImages/$id/${imageNames!.first}")
          .getDownloadURL();
    } catch (e) {
      print("Error fetching first image: $e");
      return null;
    }
  }

  /// Convert amenities list to a readable string
  String getAmenitiesString() {
    return amenities!.isEmpty ? "" : amenities!.join(", ");
  }

  /// Calculate and return current rating
  double getCurrentRating() {
    if (reviews!.isEmpty) return 4.0;

    double totalRating = reviews!.fold(0, (sum, review) => sum + review.rating!);
    return totalRating / reviews!.length;
  }

  /// Fetch host info from Firestore
  Future<void> getHostFromFirestore() async {
    await host!.getContactInfoFromFirestore();
    await host!.getImageFromStorage();
  }

  /// Get total number of guests that can be accommodated
  int getGuestNumber() {
    return (beds?['small'] ?? 0) +
        (beds?['medium'] ?? 0) * 2 +
        (beds?['large'] ?? 0) * 2;
  }

  /// Get formatted bedrooms info
  String getBedroomsText() {
    List<String> bedroomTexts = [];

    if ((beds?['small'] ?? 0) > 0) {
      bedroomTexts.add("${beds!['small']} single/twin");
    }
    if ((beds?['medium'] ?? 0) > 0) {
      bedroomTexts.add("${beds!['medium']} double");
    }
    if ((beds?['large'] ?? 0) > 0) {
      bedroomTexts.add("${beds!['large']} queen/king");
    }

    return bedroomTexts.join(", ");
  }

  /// Get formatted bathrooms info
  String getBathroomsText() {
    List<String> bathroomTexts = [];

    if ((bathrooms?['full'] ?? 0) > 0) {
      bathroomTexts.add("${bathrooms!['full']} full");
    }
    if ((bathrooms?['half'] ?? 0) > 0) {
      bathroomTexts.add("${bathrooms!['half']} half");
    }

    return bathroomTexts.join(", ");
  }

  /// Get full address in a readable format
  String getFullAddress() {
    return "$address, $city, $country";
  }
}
