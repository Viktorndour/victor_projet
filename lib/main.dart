import 'package:flutter/material.dart';
import 'package:victor_projet/screen/login_screen.dart';
import 'package:victor_projet/widgets/bottomNav.dart/bottomNav.dart';
import 'package:victor_projet/widgets/menuDrawer.dart/menuDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "premier application",
      home: LoginScreen());
  }
}

class PageAcceuil extends StatefulWidget {
  PageAccueilState createState() => PageAccueilState();
}

class PageAccueilState extends State<PageAcceuil> {
  int _nbrelikes=0;
  int nbredislikes=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuDrawer(),
        bottomNavigationBar: BottomNav(
          indexSelection: 0,
          ),
        appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text(
              "page Acceuil",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Image.asset(
              //   "assets/images/KEVIN17.jPG",
              // ),
              // ,
              Image.network("https://mir-s3-cdn-cf.behance.net/project_modules/fs/e72894117148323.60700ef194be0.jpg"),
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    'Rencontrez victor, le roi autoproclamé des gaffe technologiques !'
                    'Avec ses talent comiques aussi aiguisé qu\'un couteau emoussé,'
                    'Il est trés douer au football a un point qu\on le surnomme kdb'
                    'victor transforme chaque tentative de resolution de probleme'
                    'malgres ses maladresse ,son esprit jovial et sa capacite',
                    softWrap: true,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            _nbrelikes++;
                          });
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "${_nbrelikes}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red))),
                     
                    ],
                  ),
                
                  Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(Icons.thumb_down),
                                iconSize: 50,
                                onPressed: () {
                                  setState(() {
                                    nbredislikes++;
                                  });
                                }),
                            Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "${nbredislikes}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red))),
                          ]),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
