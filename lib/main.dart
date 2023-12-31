import 'package:flutter/material.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
      MyApp(
        child: MaterialApp(
      title: 'Users App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    //  home: const MySplashScreen(),
      // home: Scaffold(
      //   appBar: AppBar(title: const Text("Welcome to drivers App")),
      // ) ,
      debugShowCheckedModeBanner: false,
    )
  ));
}
 class MyApp extends StatefulWidget {
    final Widget? child;
    MyApp({this.child});

    static void restartApp(BuildContext context){
      context.findAncestorStateOfType<_MyAppState>()!.restartApp();

    }

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }
   @override
   Widget build(BuildContext context) {
     return KeyedSubtree(
         key: key,
         child: widget.child!,
     );
   }
 }


