import 'package:flutter/material.dart';
import 'package:housify/view/guestScreens/account_screen.dart';
import 'package:housify/view/guestScreens/explore_screen.dart';
import 'package:housify/view/guestScreens/inbox_screen.dart';
import 'package:housify/view/guestScreens/saved_listing_screen.dart';
import 'package:housify/view/guestScreens/trips_screen.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {

  int selectedIndex = 0;

 final List<String> screenTitles = [
   
   'Explore',
   'Saved',
   'Trips',
   'Inbox',
   'Profiles',
 ];

 final List<Widget> screens = [
   
   ExploreScreen(),
   SavedListingScreen(),
   TripsScreen(),
   InboxScreen(),
   AccountScreen(),
 ];

 BottomNavigationBarItem customNavigationBarItem(int index, IconData, String title)
 {
   return BottomNavigationBarItem(icon: Icon(
    IconData, 
    color: Colors.black,
    
    ),

    activeIcon: Icon(
      IconData,
      color: Colors.pinkd,
    )
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        onTap: (i) {
          
          setState(() {
             selectedIndex = i;
          });
        },

        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>
        [

        ],
        
      ),
    );
  }
}
