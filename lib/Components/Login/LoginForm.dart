import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/custom_surfix_icon.dart';
import 'package:flutter_application_1/Components/default_button_custome_color.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/Screens/Register/Registrasi.dart';
import 'package:flutter_application_1/Screens/Home/HomeScreens.dart';
import 'package:flutter_application_1/Components/Home/HomeComponent.dart';

import '../../Screens/Home/Home.dart';

class SignUnform extends StatefulWidget {
  @override
  _SignUnform createState() => _SignUnform();
}

class _SignUnform extends State<SignUnform> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remeber = false;

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildpassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remeber,
                  onChanged: (value) {
                    setState(() {
                      remeber = value;
                    });
                  }),
              Text("Tetap Masuk"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text("Lupa Password",
                    style: TextStyle(decoration: TextDecoration.underline)),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Masuk",
            press: () {
              Navigator.pushNamed(context, HomeScreens.routeName);
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreens.routeName);
            },
            child: Text(
              "Belum Punya Akun ? Daftar Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUserName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Masukan Username Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/icons/User.svg",
          )),
    );
  }

  TextFormField buildpassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Masukan Password Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/icons/Lock.svg",
          )),
    );
  }
}
