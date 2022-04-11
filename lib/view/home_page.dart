import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/profile_page.dart';
import 'package:edhec_x_epitech/view/scan_page.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget newFoodPub(String imgUrl, String title, String desc) {
    return Container(
      width: 200,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imgUrl),
            ListTile(
              title: Text(title),
              subtitle: Text(desc),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 16,right: 16),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Les Nouveautés",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Color(0xff00833e)),),
                  Container(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        newFoodPub("https://www.carrefour.fr/media/1500x1500/Photosite/PGC/P.L.S./3302740030925_PHOTOSITE_20210804_170223_0.jpg?placeholder=1", "Parmentier de boeuf", "Nouveauté"),
                        newFoodPub("https://www.carrefour.fr/media/1500x1500/Photosite/PGC/P.L.S./3302740606106_PHOTOSITE_20211103_070716_0.jpg?placeholder=1", "Risotto au poulet", "Nouveauté"),
                        newFoodPub("https://www.carrefour.fr/media/1500x1500/Photosite/PGC/P.L.S./3302748427024_PHOTOSITE_20210803_173115_0.jpg?placeholder=1", "Filet de poulet", "Nouveauté"),
                      ],
                    ),
                  ),
                  const Text("Vos Favoris",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Color(0xff00833e)),),
                  Container(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        newFoodPub("https://www.carrefour.fr/media/1500x1500/Photosite/PGC/P.L.S./3302748427024_PHOTOSITE_20210803_173115_0.jpg?placeholder=1", "Filet de poulet", "Plat Favori"),
                        newFoodPub("https://www.carrefour.fr/media/1500x1500/Photosite/PGC/P.L.S./3302740030925_PHOTOSITE_20210804_170223_0.jpg?placeholder=1", "Parmentier de boeuf", "Plat Favori"),
                        newFoodPub("https://www.carrefour.fr/media/1500x1500/Photosite/PGC/P.L.S./3302740606106_PHOTOSITE_20211103_070716_0.jpg?placeholder=1", "Risotto au poulet", "Plat Favori"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff00833e),
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
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
          if(index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          } else if(index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage()));
          }
        },
      ),
    );
  }
}