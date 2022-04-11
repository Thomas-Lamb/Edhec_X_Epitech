import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/main.dart';

bottomNavBar(BuildContext context){

    return BottomNavigationBar(
      selectedItemColor: const Color(0xff00833e),
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Profil"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 50,),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          title: Text("Scan"),
        )
      ],
      onTap: (int index) {
        if(index == 1) {
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(userName: widget.userName)));
        } else if(index == 2) {
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScanPage(userName: widget.userName)));
        }
      },
    );
}