import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/profile_page.dart';
import 'package:edhec_x_epitech/view/scan_page.dart';
import 'package:edhec_x_epitech/view/promo_page.dart';
import 'package:edhec_x_epitech/view/home_page.dart';
import 'package:flutter/services.dart';

class AvisPage extends StatefulWidget{
  const AvisPage({Key? key, required this.urlImgProduct, required this.nameProduct}) : super(key: key);

  final urlImgProduct;
  final nameProduct;

  @override
  _AvisPageState createState() => _AvisPageState();
}

class _AvisPageState extends State<AvisPage> {

  final avisPrixController = TextEditingController();
  final avisQuantController = TextEditingController();
  bool? check1fir = false;
  bool? check1sec = false;
  bool? check1thi = false;
  bool? check1fou = false;
  bool? check1fiv = false;

  bool? check2fir = false;
  bool? check2sec = false;

  bool? check3fir = false;
  bool? check3sec = false;

  void validateLogin(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PromoPage()));
  }

  Widget buildInput(String boxName, final myController){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: boxName,
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade600),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color:  Color(0xff00833e),
          )
        ),
      ),
      controller: myController,
      textInputAction: TextInputAction.next,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 0,),
                Text("Vous avez scané le ${widget.nameProduct.toString()}",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                const SizedBox(height: 6,),
                Text("Un dernier petit effort pour avoir votre réduction !",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                const SizedBox(height: 50,),
                Container(
                  child: Image.network(widget.urlImgProduct.toString()),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text("Quel est votre régime alimentaire ?", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Viande rouge", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check1fir,
                          onChanged: (bool? value) {
                            setState(() {
                              check1fir = value;
                              if (value == true) {
                                check1sec = false;
                                check1thi = false;
                                check1fou = false;
                                check1fiv = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Viande blanche", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check1sec,
                          onChanged: (bool? value) {
                            setState(() {
                              check1sec = value;
                              if (value == true) {
                                check1fir = false;
                                check1thi = false;
                                check1fou = false;
                                check1fiv = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Poisson", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check1thi,
                          onChanged: (bool? value) {
                            setState(() {
                              check1thi = value;
                              if (value == true) {
                                check1fir = false;
                                check1sec = false;
                                check1fou = false;
                                check1fiv = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Crudités", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check1fou,
                          onChanged: (bool? value) {
                            setState(() {
                              check1fou = value;
                              if (value == true) {
                                check1fir = false;
                                check1sec = false;
                                check1thi = false;
                                check1fiv = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Veggie", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check1fiv,
                          onChanged: (bool? value) {
                            setState(() {
                              check1fiv = value;
                              if (value == true) {
                                check1fir = false;
                                check1sec = false;
                                check1thi = false;
                                check1fou = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Etes-vous regardant sur les scores nutritifs ?", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Oui", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check2fir,
                          onChanged: (bool? value) {
                            setState(() {
                              check2fir = value;
                              if (value == true) check2sec = false;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Non", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check2sec,
                          onChanged: (bool? value) {
                            setState(() {
                              check2sec = value;
                              if (value == true) check2fir = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Trouvez-vous les quantités de nos produits\nsuffisantes ?", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Oui", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check3fir,
                          onChanged: (bool? value) {
                            setState(() {
                              check3fir = value;
                              if (value == true) check3sec = false;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Non", style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: check3sec,
                          onChanged: (bool? value) {
                            setState(() {
                              check3sec = value;
                              if (value == true) check3fir = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                        child: const Text("Envoyer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}