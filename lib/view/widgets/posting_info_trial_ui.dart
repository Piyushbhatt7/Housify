import 'package:flutter/material.dart';

class PostingInfoTrialUi extends StatefulWidget {\
 
 IconData? iconData;
 String? category;
 String? categoryInfo;

 PostingInfoTrialUi({super.key, this.iconData, this.category, this.categoryInfo});

  @override
  State<PostingInfoTrialUi> createState() => _PostingInfoTrialUiState();
}

class _PostingInfoTrialUiState extends State<PostingInfoTrialUi> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}