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

     setState(() {
       
     });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   posting = widget.posting;

   updateUi();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        AspectRatio(
          aspectRatio: 3 / 2,
          child: (posting!.displayImage!.isEmpty) ? Container() : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: posting!.displayImage!.first,
                fit: BoxFit.fill,
                )
            ),
          ),
           ),

           Text(
            "${posting!.type} - ${posting!.city}, ${posting!.country}",
             maxLines: 2,
             style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
             ),
           ),

           
      ],
    );
  }
}