import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Screens/Home/HomeScreens.dart';
import 'package:flutter_application_1/Screens/Login/LoginScreens.dart';
import 'package:flutter_application_1/Screens/Register/Registrasi.dart';
import 'package:flutter_application_1/Screens/Register/RegisterScreens.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/UI/testapi.dart';
import 'UI/homePage.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Toko Gitar Keren",
    theme: theme(),
    // initialRoute: LoginScreens.routeName,
    routes: routes,
    home: APIPage(),
    // home: HomePage(),
  ));
}

// class LoginComponent extends StatefulWidget {
//   const LoginComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Toko Gitar Keren',
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),

//     ); 
//   }
// }