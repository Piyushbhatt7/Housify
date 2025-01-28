import 'package:flutter/material.dart';

class PostingTileButton extends StatelessWidget {
  const PostingTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/11.0
    );
  }
}