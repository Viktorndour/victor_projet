import 'package:flutter/material.dart';
import 'package:victor_projet/modeles/personne/personne.dart';
import 'package:victor_projet/widgets/bottomNav.dart/bottomNav.dart';
import 'package:victor_projet/widgets/menuDrawer.dart/menuDrawer.dart';
class pageCommunaute extends StatefulWidget {
  pageCommunauteState createState() => pageCommunauteState();
}
class pageCommunauteState extends State<pageCommunaute> {
  List<personne> listepersonnes = [
    personne(1, 'will smith', 'Acteur', 773547865,
        'https://www.premiere.fr/sites/default/files/styles/scale_crop_1280x720/public/2023-08/sony-plans-new-men-in-black-trilogy-without-will-s_216j.jpg'),
    personne(2, 'Golshifteh Farahani', 'Actrice', 784568900,
        'https://numero.twic.pics/images/flexible_grid/100/d_unit_17693_rtyler-rake-netflix-interview-golshifteh-farahani-numero-magazine.jpg?twic=v1/quality=83/truecolor=true/output=jpeg'),
    personne(3, 'scarlett johansson', 'Actrice', 775990097,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Scarlett_Johansson_by_Gage_Skidmore_2019.jpg/1200px-Scarlett_Johansson_by_Gage_Skidmore_2019.jpg'),
    personne(4, 'wentworth miller', 'Actrice', 762453767,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Wentworth_by_Andrew_Horovitz.JPG/220px-Wentworth_by_Andrew_Horovitz.JPG'),
    personne(5, 'Alice lehman', 'Footballeuse professionnelle', 776583423,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/20160319_U17W_GERSUI_9186.jpg/220px-20160319_U17W_GERSUI_9186.jpg'),           
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
       bottomNavigationBar: BottomNav(
         indexSelection: 1,
       ),
       appBar: AppBar(
       backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            "page communauté",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
    )),
       body: buildListView());

}
 ListView buildListView() {
    return ListView.separated(
      itemCount: listepersonnes.length,
      itemBuilder: (contex, index) {
        final pers =listepersonnes.elementAt(index);
        final item = listepersonnes.elementAt(index).nom;

        return Container(
          key: Key(pers.id.toString()),
          child: getLisTile(index, contex, item),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.red,
      ),
    );
  }  
   
  ListTile getLisTile(int index, BuildContext context, String item) {
    personne pers = listepersonnes[index];
    return ListTile(
     title: Text("${pers.nom}"),
      subtitle: Text(pers.metier + "tel.:${pers.telephone}"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pers.imageprofile),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            listepersonnes.removeAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('$item a été suprimé de la liste'),
            // Optional duration
          ));  
        },
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => 
              getAlertDialogInfosPersonne(pers, context));
          },
        );
    }
  }
  AlertDialog getAlertDialogInfosPersonne(personne pers, BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      title: Text(
        "Details des informations",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: getAlerDialogsDetailInfos(pers),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "ok",
            style: TextStyle(color: Colors.white),
          ))
      ],
    );    
  }
  getAlerDialogsDetailInfos(personne pers) {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(pers.imageprofile),
                radius: 90,
              ),
              Text(
                pers.nom,
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                pers.metier,
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                pers.telephone.toString(),
                 textAlign: TextAlign.center,
                textScaleFactor: 2.0,
                style: TextStyle(color: Colors.white),
              ),
            ],  
          ),
        ),
      ],)
    );
  }