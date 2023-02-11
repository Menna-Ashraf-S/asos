import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/local/log_data.dart';
import 'package:flutter_app/local/log_dbHelper.dart';
import 'package:flutter_app/pages/navigation.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:page_transition/page_transition.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  GlobalKey<FormState> _key = GlobalKey();
  bool check = true;
  late LOGDbHelper helper;
  String? username;
  String? email;
  String? password;

  void initState() {
    super.initState();
    helper = LOGDbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _key,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/log',
                      );
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 170,
                  height: 150,
                  child: Image.asset('assets/cart.png')),
              SizedBox(
                height: 30,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                    fontFamily: 'Oswald-VariableFont_wght',
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 19, 140, 206)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username can\'t be empty';
                    }
                    username = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(220, 180, 180, 180),
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 330,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email can\'t be empty';
                    }
                    email = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(220, 180, 180, 180),
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 330,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password can\'t be empty';
                    }
                    password = value;
                    return null;
                  },
                  obscureText: check,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          check = !check;
                        });
                      },
                      icon: Icon(
                        check ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(220, 180, 180, 180),
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 330,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value != password) {
                      return 'Password does\'t match';
                    }

                    return null;
                  },
                  obscureText: check,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          check = !check;
                        });
                      },
                      icon: Icon(
                        check ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(220, 180, 180, 180),
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      LogData dataSQL = LogData({
                        'username': username,
                        'email': email,
                        'password': password
                      });
                      int id = await helper.createlog(dataSQL);
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Navigation()));
                      loggedData(email!, password!);
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
