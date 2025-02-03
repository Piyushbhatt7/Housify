import 'package:flutter/material.dart';
import 'package:housify/models/posting_model.dart';

class ViewPostingScreen extends StatefulWidget {

  PostingModel? posting;

   ViewPostingScreen({super.key, this.posting});

  @override
  State<ViewPostingScreen> createState() => _ViewPostingScreenState();
}

class _ViewPostingScreenState extends State<ViewPostingScreen> {

  PostingModel? posting;

  getRequiredInfo()
  {
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.posting;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}