import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/home_page.dart';
import 'package:edhec_x_epitech/view/scan_page.dart';
import 'package:edhec_x_epitech/data/user.dart';
import 'package:edhec_x_epitech/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Profil",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Color(0xff00833e)),),
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: const Text("Mes informations personelles", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Prenom : ", style: TextStyle(fontSize: 15,color: Colors.grey.shade500)),
                      Text(user.firstName(), style: TextStyle(fontSize: 20,color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Nom : ", style: TextStyle(fontSize: 15,color: Colors.grey.shade500)),
                      Text(user.lastName(), style: TextStyle(fontSize: 20,color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Age : ", style: TextStyle(fontSize: 15,color: Colors.grey.shade500)),
                      Text(user.age().toString(), style: TextStyle(fontSize: 20,color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Tel :", style: TextStyle(fontSize: 15,color: Colors.grey.shade500)),
                      Text("07 70 34 23 68", style: TextStyle(fontSize: 20,color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("E-mail : ", style: TextStyle(fontSize: 15,color: Colors.grey.shade500)),
                      Text(user.email(), style: TextStyle(fontSize: 20,color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Date de création : ", style: TextStyle(fontSize: 15,color: Colors.grey.shade500)),
                      Text(user.dateCreation(), style: TextStyle(fontSize: 20,color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade800,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Modifier", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      Text("Déconnexion", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("CGV"),
                      Text("RGU"),
                      Text("RGPD"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar()
    );
  }

  bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xff00833e),
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 50,),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: "Scan",
        )
      ],
      onTap: (int index) {
        if(index == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if(index == 2) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScanPage()));
        }
      },
    );
  }
}