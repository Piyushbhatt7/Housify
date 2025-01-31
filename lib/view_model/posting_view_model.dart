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
       
     };
  }
}