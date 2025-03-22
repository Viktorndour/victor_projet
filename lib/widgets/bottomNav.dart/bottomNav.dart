import 'package:flutter/material.dart';
import 'package:victor_projet/main.dart';
import 'package:victor_projet/screen/communaute_scren.dart/communaute_screen.dart';

class BottomNav extends StatefulWidget {
  int indexSelection;
   BottomNav({super.key, required this.indexSelection});
  //BottomNav({key?key});
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  
  void getSelectItem() {
    switch (widget.indexSelection) {
      case 0:
        Navigator.push(context,MaterialPageRoute(builder:(context)
=> PageAcceuil()));
       break;
     case 1:
       Navigator.push(context,MaterialPageRoute(builder:(context)
=> pageCommunaute()));
       break;
      default:
       break; 
    }
  }
  @override
  Widget build(BuildContext) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          label: "Accueil",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "communauté",
          icon: Icon(Icons.person)
        )
      ],
      currentIndex: widget.indexSelection,
      onTap: (newIndex) {
        setState(() {
          widget.indexSelection = newIndex;
          getSelectItem();
        });
      },
    );
  }
}