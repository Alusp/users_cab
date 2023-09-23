import 'dart:async';
import 'package:flutter/material.dart';

import 'authentication/login_screen.dart';
import 'global/global.dart';
import 'mainScreens/main_screen.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> 
{
  startTimer(){
    Timer(const Duration(seconds: 4), () async {
     // Send User to Home Screen
      if ( await fAuth.currentUser != null){
        currentfirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
      }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
        }

    } );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo1.png"),
              const SizedBox(height: 20,),
              Image.asset("images/logo.png"),
              const SizedBox(height: 10,),
              const Text("Users Cab",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                
                fontWeight: FontWeight.bold
              ),),

            ],
          ),
        ),
      ),
    );
  }
}

