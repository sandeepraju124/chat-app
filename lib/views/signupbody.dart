import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled11/services/database.dart';
import 'package:untitled11/views/helperfunctions.dart';
import 'package:untitled11/views/login.dart';

import 'homescreen.dart';

// ignore: must_be_immutable
class Signupbody extends StatelessWidget {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Database database = new  Database();


  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [


              SvgPicture.asset(
                'assets/signup.svg',
                height: size.height * 0.3,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(23)),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: TextStyle(
                          color: Color(0xFF6F35A5), fontFamily: 'bold'),
                      hintText: 'Username',
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(23)),
                alignment: Alignment.centerLeft,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Color(0xFF6F35A5), fontFamily: 'bold'),
                      hintText: 'Email',
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(23)),
                alignment: Alignment.centerLeft,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Color(0xFF6F35A5), fontFamily: 'bold'),
                      hintText: 'Create Password',
                      suffixIcon: Icon(Icons.visibility),
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(

                  onTap: () async {
                   //  Map<String, dynamic> userData= {'email': email.text,
                   //    'username': username.text,};
                    print('here controller');
                    print(email.text);
                    print(username.text);
                    SharedPreferences preps = await SharedPreferences.getInstance();
                    preps.setString('email', email.text);
                    preps.setString('username', username.text);
                    print('after controller');
                    print(email.text);
                    print(username.text);
                    // SharedPreferences preps = await SharedPreferences.getInstance();
                    var emailprep = preps.getString('email');
                    var thisismyname = preps.getString('username');
                    print('after shared');
                    print(emailprep);
                    print(thisismyname);

                   // await database.addUserInfo(userData);



                    // Map<String,dynamic>usermap = {
                    //   'email':'sandysandy7@gmail.com',
                    //   'username': 'sandy'
                    // };
                    // FirebaseFirestore.instance.collection('users').add(usermap);
                    //


                    //     .then((result){
                    // if(result != null){
                    //
                    // Map<String,String> userDataMap = {
                    // "userName" : usernameEditingController.text,
                    // "userEmail" : emailEditingController.text
                    // };

                    try {UserCredential userCredential =await firebaseAuth.createUserWithEmailAndPassword(
                        // ignore: missing_return
                        email: email.text, password: password.text).then((result) {
                      if(result != null){Map<String, String> userDataMap = {
                        "username": username.text,
                        "email": email.text
                      };

                      database.addUserInfo(userDataMap);
                      HelperFunctions.saveUserLoggedInSharedPreference(true);
                      HelperFunctions.saveUserNameSharedPreference(username.text);
                      HelperFunctions.saveUserEmailSharedPreference(email.text);
                      }

                    });

                   // //
                   // final SharedPreferences preps = await SharedPreferences.getInstance();
                   // await preps.setString('sharedemail', email.text);
                   // await preps.setString('sharedusername', username.text);
                   //
                   //  var sharedusername = preps.getString('username');
                   //  var sharedemail = preps.getString('email');
                   //  print('sharedemail');
                   //  print(sharedusername);
                   //  print(sharedemail);









                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) => HomePage()), (route) => false);
                    }catch(e){
                      final snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);


                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff007EF4),
                      const Color(0xff2A75BC)
                    ]),
                    borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Sign Up With Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 76,
                      ),
                      Text('Already have a account?'),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>LogIn()),
                                  (route) => false);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xFF6F35A5),
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
