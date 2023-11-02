import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Register/RegisterForm.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/utils/constants.dart';

class RegisterComponent extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Registrasi",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SignUnform(),
            ],
          ),
        ),
      ),
    );
  }
}
