import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Login/LoginComponent.dart';
import 'package:flutter_application_1/size_config.dart';

class LoginScreens extends StatelessWidget {
  static String routeName = "/sign-in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: LoginComponent(),
    );
  }
}
