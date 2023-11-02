import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/homePage.dart';
import 'package:flutter_application_1/UI/packagesPage.dart';

Widget buildBottomBar(index, BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    backgroundColor: Color.fromARGB(255, 184, 195, 204),
    onTap: (i) {
      switch (i) {
        case 0:
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => HomePage()));
          break;
        case 1:
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => packagesPage()));
          break;
        default:
      }
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: "Gitar"),
    ],
  );
}
