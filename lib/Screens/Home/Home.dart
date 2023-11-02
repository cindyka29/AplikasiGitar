import 'package:flutter/material.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/Components/Home/HomeComponent.dart';

class HomeScreens extends StatelessWidget {
  static String routeName = "/sign-up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: HomeComponent(),
    );
  }
}
