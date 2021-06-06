import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/login.svg',
              height: size.height * 0.3,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF1E6FF),
                            borderRadius: BorderRadius.circular(23)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintStyle: TextStyle(
                                  color: Color(0xFF6F35A5), fontFamily: 'bold'),
                              hintText: 'Email or Phone',
                              contentPadding: EdgeInsets.all(15)),
                        ),
                      ),
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
                    child: TextField(
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
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'RobotoMono',
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
                      'Sign in With Google',
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
                          Text('don\'t have a account?'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'sign up',
                            style: TextStyle(
                                color: Color(0xFF6F35A5),
                                fontStyle: FontStyle.italic),
                          )
                          
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
