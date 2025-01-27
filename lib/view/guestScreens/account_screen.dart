import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housify/models/app_constants.dart';
import 'package:housify/view/guest_home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  modifyHostingMode()
  {
    if(AppConstants.currentUser.isHost!)
    {
      if(AppConstants.currentUser.isCurrentlyHosting!)
      {
         AppConstants.currentUser.isCurrentlyHosting = false;

         Get.to(GuestHomeScreen());
      }
      else {

      }
    }

    else {

    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // user info
                 Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Center(
                    child: Column(
                      children: [

                        // image
                          MaterialButton(
                             onPressed: ()
                          {
                            
                          },
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: MediaQuery.of(context).size.width / 4.5,
                              child: CircleAvatar(
                                backgroundImage: AppConstants.currentUser.displayImage,
                                radius: MediaQuery.of(context).size.width / 4.6,
                              ),
                            ),
                           
                          ),

                          const SizedBox(height: 10,),
                      // name and email  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text(
                                  AppConstants.currentUser.getFullNameOfUser(),
                                  style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  AppConstants.currentUser.email.toString(),
                                  style: const TextStyle(
                                        fontSize: 15,
                                  ),
                                )
                            ],
                          )
                      ],
                    ),
                  ),
                 ),
              
              // buttons
                 ListView(
                  shrinkWrap: true,
                  children: [
             
             // "Personal Information",
          
             Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.amberAccent,
          ],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 0),
          stops: [0, 1],
          tileMode: TileMode.clamp,
        )),

        child: MaterialButton(
          height: MediaQuery.of(context).size.height/9.1,

          onPressed: ()
        {

        },
         child: const ListTile(
          contentPadding: EdgeInsets.all(0.0),
          leading: Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18.5,
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: Icon(
            size: 34,
            Icons.person_2
          ),
         ),
        ),
                      ),

              // guest mode and host mode
               Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.amberAccent,
          ],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 0),
          stops: [0, 1],
          tileMode: TileMode.clamp,
        )),

        child: MaterialButton(
          height: MediaQuery.of(context).size.height/9.1,

          onPressed: ()
        {
            modifyHostingMode();
        },
         child: const ListTile(
          contentPadding: EdgeInsets.all(0.0),
          leading: Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18.5,
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: Icon(
            size: 34,
            Icons.hotel_class_outlined
          ),
         ),
        ),
                      ),
                       
                  ],
                 )
              ],
            ),
            ),
    );
  }
}