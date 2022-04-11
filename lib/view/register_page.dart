import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/home_page.dart';
import 'package:edhec_x_epitech/view/login_page.dart';
import 'package:edhec_x_epitech/data/user.dart';
import 'package:edhec_x_epitech/main.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final passController = TextEditingController();
  bool error = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateRegister() {
    if (emailController.text.isNotEmpty && firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && ageController.text.isNotEmpty) {
      if (user.register(emailController.text, passController.text, firstNameController.text, lastNameController.text, int.parse(ageController.text))) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        error = true;
      }
    }
  }

  Widget emailInput(String boxName){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: boxName,
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
      textInputAction: TextInputAction.next,
    );
  }

  Widget firstNameInput(String boxName){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: boxName,
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
      controller: firstNameController,
      textInputAction: TextInputAction.next,
    );
  }

  Widget lastNameInput(String boxName){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: boxName,
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
      controller: lastNameController,
      textInputAction: TextInputAction.next,
    );
  }

  Widget ageInput(String boxName){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: boxName,
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
      controller: ageController,
      textInputAction: TextInputAction.next,
    );
  }

  Widget passInput(){
    return Container(
      height: 100,
        child: TextFormField(
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
          Pattern pattern =
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
          RegExp regex = RegExp(pattern.toString());
          if (password!.isEmpty){
            return 'Entrez un mot de passe';
          } else if (!regex.hasMatch(password)) {
            return 'Entrer un mot de passe valide';
          } else {
            return null;
          }
        },
        controller: passController,
        textInputAction: TextInputAction.done,
        obscureText: _obscureText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: ListView(
            children: [
              Form(
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
                        Text("Créer ton compte pour profiter de notre application !",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                        const SizedBox(height: 50,),
                      ],
                    ),
                    Column(
                      children: [
                        firstNameInput('Prénom'),
                        const SizedBox(height: 10,),
                        lastNameInput('Nom'),
                        const SizedBox(height: 10,),
                        emailInput('Adresse mail'),
                        const SizedBox(height: 10,),
                        ageInput('Age'),
                        const SizedBox(height: 10,),
                        passInput(),
                        const SizedBox(height: 8,),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: validateRegister,
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
                                child: const Text("Inscription",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                              const Text("Déjà un compte?",style: TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(width: 5,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                },
                                child: const Text("Connecte toi",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff82bc00)),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}