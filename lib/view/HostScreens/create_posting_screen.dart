import 'package:flutter/material.dart';

class CreatePostingScreen extends StatefulWidget {
  const CreatePostingScreen({super.key});

  @override
  State<CreatePostingScreen> createState() => _CreatePostingScreenState();
}

class _CreatePostingScreenState extends State<CreatePostingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create / Update a Posting"
        ),

        actions: [
          IconButton(onPressed: ()
          {
            

          }, icon: const Icon(Icons.upload)
          )
        ],
      ),
    );
  }
}