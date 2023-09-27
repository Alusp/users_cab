import 'package:flutter/material.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/splash_screen.dart';

class MyDrawer extends StatefulWidget {

  String? name;
  String? email;

  MyDrawer({this.name, this.email});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}


class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Drawer header
          Container(
            height: 165,
            color: Colors.grey,
            child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                 const Icon(Icons.person,
                    size: 40,
                    color: Colors.grey,
                    ),
              const SizedBox(width: 16,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name.toString(),
                          style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(
                          widget.email.toString(),
                          style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),)
                      ],
                    )
                  ],
                )),
          ),

          SizedBox(height: 12.0,),

          //drawer Body
          GestureDetector(
            onTap: (){

            },
            child: const ListTile(
              leading: Icon(Icons.history, color: Colors.blue,),
              title: Text(
                "History",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: const ListTile(
              leading: Icon(Icons.person, color: Colors.blue,),
              title: Text(
                "Visit Profile",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: const ListTile(
              leading: Icon(Icons.info, color: Colors.blue,),
              title: Text(
                "About",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
               fAuth.signOut();
               Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
            },
            child: const ListTile(
              leading: Icon(Icons.logout, color: Colors.blue,),
              title: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          )

          //drawer Body
        ],
      ),
    );
  }
}
