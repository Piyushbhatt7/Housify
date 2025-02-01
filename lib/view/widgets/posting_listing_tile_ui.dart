import 'package:flutter/material.dart';
import 'package:housify/models/posting_model.dart';

class PostingListingTileUi extends StatefulWidget {

  PostingModel? posting;
  
   PostingListingTileUi({super.key, this.posting});

  @override
  State<PostingListingTileUi> createState() => _PostingListingTileUiState();
}

class _PostingListingTileUiState extends State<PostingListingTileUi> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}