import 'package:flutter/material.dart';
import 'package:flutter_app/local/log_data.dart';
import 'package:flutter_app/local/log_dbHelper.dart';

String? email;
String? username;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late LOGDbHelper helper;

  void initState() {
    super.initState();
    helper = LOGDbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 150,
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(right: 15),
            width: 190,
            height: 150,
            child: Image.asset('assets/cart.png'),
          ),
        ),
        SizedBox(
          height: 65,
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                            text: 'Username:  ',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 19, 140, 206),
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '${username}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ]),
              )),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                            text: 'Email: ',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 19, 140, 206),
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '${email}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                      ),
                    ]),
              )),
        ),
        SizedBox(
          height: 75,
        ),
        Container(
          width: 300,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amberAccent[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/log',
              );
            },
          ),
        )
      ]),
    );
  }
}

void loggedData(String emaillog, String usernamelog) {
  email = emaillog;
  username = usernamelog;
}
