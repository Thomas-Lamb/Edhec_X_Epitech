import 'package:edhec_x_epitech/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/data/user.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

User user = User();

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edhec-X-Epitech',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Edhec_X_Epitech')),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text('Login',
                        style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                    )),
                TextButton(
                  onPressed: (){},
                  child: const Text('Register',
                    style: TextStyle(color: Colors.blue),),
                )
              ],
            )
        )
    );
  }
}