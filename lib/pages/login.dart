import 'package:flutter/material.dart';
import 'package:flutter_app/local/log_dbHelper.dart';
import 'package:flutter_app/pages/navigation.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:page_transition/page_transition.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool check = true;
  GlobalKey<FormState> _key = GlobalKey();
  late LOGDbHelper helper;
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
                  height: 120,
                ),
                Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 170,
                    height: 150,
                    child: Image.asset('assets/cart.png')),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Log In",
                  style: TextStyle(
                      fontFamily: 'Oswald-VariableFont_wght',
                      fontSize: 44,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 19, 140, 206)),
                ),
                SizedBox(
                  height: 50,
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
                  height: 30,
                ),
                Container(
                  width: 200,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        helper.outdata(email!, password!).then((value) => {
                              if (value.isNotEmpty)
                                {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: Navigation())),
                                  loggedData(email!, value.first.username!)
                                }
                              else
                                {showSnackBar(context)}
                            });
                      }
                    },
                    child: Text(
                      "Log In",
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
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Don\'t Have An Account ? ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: SignUP()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 252, 56, 80),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Wrong Email or Password')));
  }
}
