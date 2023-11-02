import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login/LoginScreens.dart';
import 'package:flutter_application_1/Screens/Register/RegisterScreens.dart';
import 'Screens/Home/Home.dart';
import 'Screens/Register/RegisterScreens.dart';
import 'package:flutter_application_1/Screens/Home/HomeScreens.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreens.routeName: (context) => LoginScreens(),
  RegisterScreens.routeName: (context) => RegisterScreens(),
  HomeScreens.routeName: (context) => HomeScreens(),
};
