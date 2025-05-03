import 'package:flutter/material.dart';
import 'package:victor_projet/main.dart';
import 'package:victor_projet/screen/communaute_scren.dart/communaute_screen.dart';
import 'package:victor_projet/screen/countries_screen.dart';

class BottomNav extends StatefulWidget {
  int indexSelection;
  BottomNav({super.key, required this.indexSelection});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  void getSelelctItem() {
    switch (widget.indexSelection) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PageAcceuil()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => pageCommunaute()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CountriesScreen()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.indigoAccent,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(label: "Acceuil", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Communaute", icon: Icon(Icons.person)),
        BottomNavigationBarItem(label: "Pays", icon: Icon(Icons.flag)),
      ],
      currentIndex: widget.indexSelection,
      onTap: (newIndex) {
        if (widget.indexSelection != newIndex) {
          setState(() {
            widget.indexSelection = newIndex;
            getSelelctItem();
          });
        }
      },
    );
  }
}
