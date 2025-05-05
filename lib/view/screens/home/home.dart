import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation/view/screens/home/tabs/generate_trip_tab.dart';
import 'package:graduation/view/screens/home/tabs/home_tab.dart';
import 'package:graduation/view/screens/home/tabs/marked_trips_tab.dart';
import 'package:graduation/view/screens/home/tabs/profile_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex=0;
  List<Widget> tabs=[
    const HomeTab(),
    const GenerateTripTab(),
    const MarkedTripsTab(),
    const ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.blue,title: const Text("Trip Minder",style: TextStyle(color: Colors.white),),),
      bottomNavigationBar: CurvedNavigationBar(items: const [
        Icon(Icons.home_filled,size: 40,color: Colors.white,),
        Icon(Icons.auto_awesome,size: 40,color: Colors.white,),
        Icon(Icons.bookmark_outlined,size: 40,color: Colors.white,),
        Icon(Icons.person,size: 40,color: Colors.white,),

      ],
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        color: Colors.blue,
        index: pageIndex,
        onTap: (value) => setState(() {
          pageIndex=value;
        }),

      ),
      body: tabs[pageIndex],
    );
  }
}
