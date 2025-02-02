import 'package:flutter/material.dart';
import 'package:housify/models/posting_model.dart';

class PostingGridTileUi extends StatefulWidget {
 
  PostingModel? posting;

   PostingGridTileUi({super.key, this.posting});

  @override
  State<PostingGridTileUi> createState() => _PostingGridTileUiState();
}

class _PostingGridTileUiState extends State<PostingGridTileUi> {

  PostingModel? posting;

  updateUi () async
  {
     await posting!.getFirstImageFromStorage();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   posting = widget.posting;

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}