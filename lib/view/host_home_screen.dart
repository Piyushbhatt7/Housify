import 'package:flutter/material.dart';
import 'package:housify/view/HostScreens/booking_screen.dart';
import 'package:housify/view/HostScreens/my_posting_screen.dart';
import 'package:housify/view/guestScreens/account_screen.dart';
import 'package:housify/view/guestScreens/explore_screen.dart';
import 'package:housify/view/guestScreens/inbox_screen.dart';
import 'package:housify/view/guestScreens/saved_listing_screen.dart';
import 'package:housify/view/guestScreens/trips_screen.dart';

class HostHomeScreen extends StatefulWidget {
  const HostHomeScreen({super.key});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

class _HostHomeScreenState extends State<HostHomeScreen> {

  int selectedIndex = 0;

 final List<String> screenTitles = [
   
    'Bookings',
    'My Postings',
    'Inbox',
    'Profile',
 ];

 final List<Widget> screens = [
   
   BookingScreen(),
   MyPostingScreen(),
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
      color: Colors.pink,
    ),
    label: title,
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: Text(screenTitles[selectedIndex],
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      
      
      ),
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

          customNavigationBarItem(0, Icons.search, screenTitles[0]),
          customNavigationBarItem(1, Icons.favorite_border, screenTitles[1]),
          customNavigationBarItem(2, Icons.hotel, screenTitles[2]),
          customNavigationBarItem(3, Icons.message, screenTitles[3]),
          customNavigationBarItem(4, Icons.percent_outlined, screenTitles[4]),

        ],
        
      ),
    );
  }
}
