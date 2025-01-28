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
        
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.amber,
              ]
            
            )
          ),
        ),
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