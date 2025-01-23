import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
    
    String? email;
    String? password;
    String? bio;
    String? city;
    String? country;
    bool?  isHost;
    bool? isCurrentlyHosting;
    DocumentSnapshot? snapshot;
    
    UserModel({
   String? id;
   String? firstName;
   String? lastName;
   String? fullName;
   MemoryImage? displayImage;
       this.email = "",
       this.password = "",
       this.bio = "",
       this.city = "",
       this.country = "",
    });
    
}