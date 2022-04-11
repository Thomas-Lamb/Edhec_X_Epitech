import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/home_page.dart';
import 'package:edhec_x_epitech/view/register_page.dart';
import 'package:edhec_x_epitech/data/user.dart';
import 'package:edhec_x_epitech/main.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  String _emailID = "", _password = "";
  final _email = "abc@gmail.com", _pass = "azerty";
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateLogin(){
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      if (user.authentication(emailController.text, passController.text)) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }

  Widget emailInput(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "E-mail",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade500),
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
      validator: (email) {
        if (email!.isEmpty) {
          return 'Rentrez une adresse mail valide';
        } else {
          return null;
        }
      },
      controller: emailController,
      onSaved: (email)=> _emailID = email!.toString(),
      textInputAction: TextInputAction.next,
    );
  }

  Widget passInput(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Mot de passe",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff00833e),
            )
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggle,
        ),
      ),
      validator: (password){
        //Pattern pattern =
        //    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        //RegExp regex = RegExp(pattern.toString());
        if (password!.isEmpty){
          return 'Entrez un mot de passe';
        } //else if (!regex.hasMatch(password)) {
         // return 'Entrer un mot de passe valide';}
        else {
          return null;
        }
      },
      controller: passController,
      onSaved: (password)=> _password = password!,
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 0,),
                    const Text("Bonjour,",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 6,),
                    Text("Connecte toi pour continuer!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    emailInput(),
                    const SizedBox(height: 16,),
                    passInput(),
                    const SizedBox(height: 12,),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text("Mot de passe oublié ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                    ),
                    const SizedBox(height: 30,),
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
                            child: const Text("Connexion",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Pas encore de compte?",style: TextStyle(fontWeight: FontWeight.bold),),
                          const SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context) {return const HomePage();}),
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                            },
                            child: const Text("Enregistre toi",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff82bc00)),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}