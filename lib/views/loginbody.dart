import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled11/main.dart';
import 'package:untitled11/views/homescreen.dart';
import 'package:untitled11/views/signup.dart';

// ignore: must_be_immutable
class LoginBody extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
                'assets/login.svg',
                height: size.height * 0.3,
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
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility),
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password',
                  style: TextStyle(color: Color(0xFF6F35A5)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: ()async{
                    try{
                      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
                          email: email.text, password: password.text);
                      SharedPreferences preps = await SharedPreferences.getInstance();
                      preps.setString('email', 'email.text');
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>HomePage()), (route) => false);

                    }catch(e){
                      final snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }
                  },
                  child: Text(
                    'Login',
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
                  'Login With Google',
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
                      Text('didn\'t have an account?'),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>Signup()),
                                  (route) => false);
                        },
                        child: Text(
                          'Signup',
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


