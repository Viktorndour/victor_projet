import 'package:flutter/material.dart';

class personne {
  int _id;
  String _nom;
  String _metier;
  int _telephone;
  String _imageprofile;

  personne(
   this._id, this._nom, this._metier, this._telephone, this._imageprofile);

  int get id => _id;
  set id(int value) {
   _id = value;
  }

  String get nom => _nom;
   set nom(String value) {
    _nom = value;
  }

  String get metier => _metier;
  set metier(String value) {
   _metier = value;
  }

  int get telephone => _telephone;
  set telephone(int value) {
   _telephone = value;
  }

  String get imageprofile => _imageprofile;
  set imageprofile(String value) {
   _imageprofile = value;
  }
}

