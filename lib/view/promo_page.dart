import 'package:edhec_x_epitech/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/profile_page.dart';
import 'package:edhec_x_epitech/view/scan_page.dart';
import 'package:flutter/services.dart';

class PromoPage extends StatefulWidget{
  const PromoPage({Key? key}) : super(key: key);

  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {

  void validateLogin(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                const SizedBox(height: 50,),
                const Text("Voila votre code promo !",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Color(0xff00833e)),),
                const SizedBox(height: 50,),
                Text("Nous vous remercions et vous\nsouhaitons un bon appétit",style: TextStyle(fontSize: 20,color: Colors.grey.shade600),),
                const SizedBox(height: 50,),
                Image.network("https://www.lsa-conso.fr/mediatheque/5/7/2/000025275_5.jpg"),
                const SizedBox(height: 150,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: validateLogin,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff00833e),
                            Color(0xff82bc00),
                            Color(0xffb4be00),
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                        child: const Text("Acceuil",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}