import "dart:io";
import "package:flutter/material.dart";
import 'package:victor_projet/main.dart';
import "package:victor_projet/screen/communaute_scren.dart/communaute_screen.dart";
import'package:url_launcher/url_launcher.dart';
class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/KEVIN17.jpg"),
                radius: 90,
              ),
            ),
             decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white,Colors.red],
            )),    
          ),
          ListTile(
            title: Text("Accueil"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageAcceuil()));
            },      
          ),
          ListTile(
            title: Text("communauté"),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => pageCommunaute()));
            },
          ), 
          ListTile(
            title: Text("service client"),
            leading: Icon(Icons.call),
            onTap: () {
              appeler() async {
                var numeroServiceClient = "+221 77 678 34 32";
                launch("tel:"+ numeroServiceClient);
              };
            },  
          ), 
          ListTile(
            title: Text("Quitter"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );}}            