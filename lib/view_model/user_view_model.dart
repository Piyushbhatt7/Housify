import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:housify/models/app_constants.dart';

class UserViewModel {

  signUp(email, password, firstName, lastName, city, country, bio, imageFileOfUser) async
  {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((valueResult) 
      {
          if (valueResult != null)
          {
              String currentUserId = valueResult.user!.uid; 

              AppConstants.currentUser.id = currentUserId;
              AppConstants.currentUser.email = email;
              AppConstants.currentUser.firstName = firstName;
              AppConstants.currentUser.city = city;
              AppConstants.currentUser.country = country;
              AppConstants.currentUser.bio = bio;
              AppConstants.currentUser.password = password;

              
          }
      });
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