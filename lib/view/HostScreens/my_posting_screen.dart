import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housify/models/app_constants.dart';
import 'package:housify/view/HostScreens/create_posting_screen.dart';
import 'package:housify/view/widgets/posting_tile_button.dart';

class MyPostingScreen extends StatefulWidget {
  const MyPostingScreen({super.key});

  @override
  State<MyPostingScreen> createState() => _MyPostingScreenState();
}

class _MyPostingScreenState extends State<MyPostingScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: AppConstants.currentUser.myPostings!.length + 1,
        itemBuilder: (context, index)
        {
          
          return  Padding(
        padding: EdgeInsets.fromLTRB(26, 0, 26, 26),

        child: InkResponse(

          onTap: () {
            Get.to(CreatePostingScreen(
              posting: (index == AppConstants.currentUser.myPostings!.length) ? null : 
              AppConstants.currentUser.myPostings![index],
            ));
          },

          child: Container(
            decoration: BoxDecoration(
               border: Border.all(
                color: Colors.grey,
                width: 1.2,

               ),        
            ),
            child: PostingTileButton(),
         
          ),
        ),
         );   
        }
      
      ),
      
      
       );
 
 
  }
}