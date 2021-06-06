// import 'dart:html';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/services/auth.dart';
import 'package:untitled11/views/about.dart';
import 'package:untitled11/views/homebodymain.dart';
import 'package:untitled11/views/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  double value = 0;
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;



  //
  // _imgFromGallery() async {
  //   File image = await  imagePicker.getImage(
  //       source: ImageSource.gallery, imageQuality: 50
  //   );
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue[400], Colors.blue[800]],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/whats.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Constants.myName,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Notifications',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Setting',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.nightlight_round,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Dark Mode',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () async {
                            SharedPreferences preps =
                                await SharedPreferences.getInstance();
                            preps.remove('email');
                            _signout();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => LogIn()),
                                (route) => false);
                          },
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 200,

                    child: ListTile(
                      onTap: () {Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AboutScreen()
                      ));},
                      leading: Icon(
                        Icons.workspaces_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        'About',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (context, double val, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text('AstroChat'),

                      ),
                      body: MainBodyHome(),
                    ),
                  ),
                );
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },

            // onTap: (){
            //   setState(() {
            //     value ==0
            //         ?value = 1: value =0;
            //
            //   });
            // },
          )
        ],
      ),
    );
  }

  Future<void> _signout() async {
    await FirebaseAuth.instance.signOut().then((_) {
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new LogIn(),
          ));
    });
  }
}
