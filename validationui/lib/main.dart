// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  const Text(
                    "Here to Get",
                    style: TextStyle(fontSize: 45, color: Colors.blue),
                  ),
                  const Text(
                    "Welcomed !",
                    style: TextStyle(fontSize: 45, color: Colors.blue),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter your name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "Enter correct name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter your phone number",
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                              .hasMatch(value)) {
                        return "Enter correct phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter your email",
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                              .hasMatch(value)) {
                        return "Enter correct email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sing up",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                      NeumorphicButton(
                        margin: const EdgeInsets.only(top: 10),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //check if form data are valid,
                            //your process task ahead if all data are valid
                            final snackBar =
                                SnackBar(content: Text('Submitting form'));
                            _scaffoldKey.currentState!.showSnackBar(snackBar);
                          }
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.circle(),
                          border: NeumorphicBorder(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "SING IN",
                  style: TextStyle(color: Colors.blue, fontSize: 13.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
