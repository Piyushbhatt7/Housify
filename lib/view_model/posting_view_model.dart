import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:housify/models/app_constants.dart';
import 'package:housify/models/posting_model.dart';

class PostingViewModel {

  addListingInfoToFirestore() async
  {
     PostingModel posting = PostingModel();

     posting.setImagesNames();

     Map<String, dynamic> dataMap = 
     {
       "address": posting.address,
       "amenities": posting.amenities,
       "bathrooms": posting.bathrooms,
       "description": posting.description,
       "beds": posting.beds,
       "city": posting.city,
       "country": posting.country,
       "hostID": AppConstants.currentUser.id,
       "imagesNames": posting.imageName,
       "names": posting.name,
       "price": posting.price,
       "rating": 3.5,
       "type": posting.type,
     };

     DocumentReference ref = await FirebaseFirestore.instance.collection("postings").add(dataMap);
     posting.id = ref.id;

     await AppConstants.currentUser.addPostingToMyPostings(posting); // 13:13
  }

  addImagesToFirebaseStorage () async
  {
    PostingModel posting = PostingModel();


    for(int i = 0; i< posting.displayImage!.length; i++)
    {
      Reference ref = FirebaseStorage.instance.ref().child("postingImages").child(posting.id!).child(posting.imageName[i]);
    }
  }
}