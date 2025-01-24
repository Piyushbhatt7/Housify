import 'package:cloud_firestore/cloud_firestore.dart';

class UserViewModel {

  signUp(email, password, firstName, lastName, city, country, bio, imageFileOfUser)
  {

  }
   
    Future<void> saveUserToFirestore (bio, city, country, email, firstName, lastName, id) async 
      {
        Map<String, dynamic> dataMap = 
         {
            "bio": bio,
            "city": city,
            "country": country,
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "isHost": false,
            "myPostingIds": [],
            "savedPostingIDs": [],
            "earnings": 0,
         };

         await FirebaseFirestore.instance.collection("users").doc(id).set(dataMap);
      }
}