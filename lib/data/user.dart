import 'package:flutter/material.dart';

class User {
  String _lastName = "",_firstName = "", _email = "", _dateCreation = "";
  int _age = 0;
  bool _auth = false;

  bool register(String regEmail, String regPassword, String regFirstName, String regLastName, int regAge) {
    if (_auth == true) {
      return false;
    } else {
      _email = regEmail;
      _age = regAge;
      _dateCreation = "05/11/2021";
      _firstName = regFirstName;
      _lastName = regLastName;
      _auth = true;

      return true;
    }
  }

  bool authentication(String authEmail, String authPassword) {
    if (_auth == true) {
      return false;
    } else {
      _email = authEmail;
      _age = 20;
      _dateCreation = "05/11/2021";
      _firstName = "Thomas";
      _lastName = "Lamballais";
      _auth = true;

      return true;
    }
  }

  void disconnection() {
    _auth = false;
    _lastName = "";
    _firstName = "";
    _dateCreation = "";
    _age = 0;
    _email = "";
  }

  User();

  bool isAuth() {return _auth;}
  String lastName() {return _lastName.toString();}
  String firstName() {return _firstName.toString();}
  String email() {return _email.toString();}
  String dateCreation() {return _dateCreation.toString();}
  int age() {return _age;}
}