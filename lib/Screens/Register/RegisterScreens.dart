import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Register/RegisterComponent.dart';
import 'package:flutter_application_1/size_config.dart';

class RegisterScreens extends StatelessWidget {
  static String routeName = "/sign-un";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RegisterComponent(),
    );
  }
}
