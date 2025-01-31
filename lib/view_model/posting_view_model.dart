import 'package:housify/models/posting_model.dart';

class PostingViewModel {

  addListingInfoToFirestore() async
  {
     PostingModel posting = PostingModel();

     posting.setImagesNames();
  }
}