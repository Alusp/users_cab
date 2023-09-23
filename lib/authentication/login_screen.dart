import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_app/authentication/signup_screen.dart';

import '../global/global.dart';
import '../splash_screen.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  validateForm(){
      if (!emailTextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "Email Address is not Valid");
    } else if (passwordTextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: "Password required");
    }
    else {
      loginUserNow();
    }
  }

  loginUserNow() async {

    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext c){
          return ProgressDialog(message: "Processing, Please wait...",);
        });
    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: " + msg.toString());

        })
    ).user;

    if(firebaseUser != null)
    {
      currentfirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Login Successfully.");
      Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));

    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Unable to Login.");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                 children: [
                const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/logo.png", height: 100),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 5, thickness: 2, color: Colors.white,),
            const SizedBox(height: 50),
            const Text("Login as a User",style: TextStyle(
              fontSize: 26,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            ),
                   TextField(
                     controller: emailTextEditingController,
                     keyboardType: TextInputType.emailAddress,
                     style: const TextStyle(
                       color: Colors.grey,
                     ),
                     decoration: const InputDecoration(
                         labelText: "Email",
                         hintText: "Email",
                         enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.grey,
                             )
                         ),
                         focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.grey,

                             )
                         ),
                         hintStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 10,
                         ),
                         labelStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 14,
                         )
                     ),
                   ),
                   TextField(
                     controller: passwordTextEditingController,
                     keyboardType: TextInputType.text,
                     obscureText: true,
                     style: const TextStyle(
                       color: Colors.grey,
                     ),
                     decoration: const InputDecoration(
                         labelText: "Password",
                         hintText: "Password",
                         enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.grey,
                             )
                         ),
                         focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.grey,

                             )
                         ),
                         hintStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 10,
                         ),
                         labelStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 14,
                         )
                     ),
                   ),
                   const SizedBox(height: 20),
                   ElevatedButton(onPressed: (){
                    validateForm();
                     //Todo
                   },

                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.lightGreenAccent,
                       ),
                       child: const Text(
                         "Login",
                         style: TextStyle(
                           color: Colors.black54,
                           fontSize: 18,
                         ),
                       )),
                   TextButton(
                       onPressed: ()
                       {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
                       },
                       child: const Text(
                     "Do not have an Account? SignUp Here",
                     style: TextStyle(color: Colors.grey),
                   ))
                 ],
            ),
          ),
        ),
      ),
    );
  }
}

