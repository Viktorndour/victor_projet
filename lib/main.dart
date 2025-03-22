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
              Image.network("data:image/png;base64,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"),
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
