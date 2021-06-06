import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/views/TestDart.dart';
import 'package:untitled11/views/helperfunctions.dart';
import 'package:untitled11/views/homescreen.dart';
import 'package:untitled11/views/login.dart';
import 'package:untitled11/views/searchscreenpartially.dart';

import 'package:untitled11/views/signup.dart';
import 'package:untitled11/views/splashscreen.dart';

import 'package:untitled11/views/test.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preps = await SharedPreferences.getInstance();
  var email = preps.getString('email');
  var thisismyname = preps.getString('username');

  print('here it is main');
  print(email);
  print(thisismyname);


  // HelperFunctions.saveUserLoggedInSharedPreference(true);

  runApp(MaterialApp(
      // home: HelperFunctions.saveUserNameSharedPreference != null   ? LogIn():HomePage(),
      // home: email ==null  ? LogIn():HomePage(),
      home: email ==null  ? OnboardingScreen():HomePage(),
      // home: OnboardingScreen(),
      theme: ThemeData(primarySwatch: Colors.blue)));
}



