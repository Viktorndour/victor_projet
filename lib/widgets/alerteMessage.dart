import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showMessageDialogue(
  BuildContext context, String titleMessage, String errorMessage){
showDialog(
  context: context,
  builder: (BuildContext context ) {
    return AlertDialog(
      title: Text(titleMessage),
      content:SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(errorMessage),
          ],
        )
      ),
      actions:<Widget>[
        TextButton(
          child: Text('oui'),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
      ]
    );
  }  
);

}