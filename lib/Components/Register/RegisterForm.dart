import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/custom_surfix_icon.dart';
import 'package:flutter_application_1/Components/default_button_custome_color.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/Screens/Register/Registrasi.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUnform extends StatefulWidget {
  @override
  _SignUpform createState() => _SignUpform();
}

class _SignUpform extends State<SignUnform> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? nama;
  String? email;
  bool? remeber = false;

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();
  TextEditingController txtNama = TextEditingController(),
      txtEmail = TextEditingController();

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
          buildNama(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // Row(
          //   children: [
          //     Checkbox(
          //         value: remeber,
          //         onChanged: (value) {
          //           setState(() {
          //             remeber = value;
          //           });
          //         }),
          //     // Text(""),
          //     // Spacer(),
          //     // GestureDetector(
          //     //   // onTap: () {},
          //     //   child: Text("",
          //     //       style: TextStyle(decoration: TextDecoration.underline)),
          //     // ),
          //   ],
          // ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Registrasi",
            press: () {},
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreens.routeName);
            },
            child: Text(
              "Sudah Punya Akun ? Masukkan Disini",
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
          labelText: 'username',
          hintText: 'Masukan username Anda',
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

  TextFormField buildNama() {
    return TextFormField(
      controller: txtNama,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'nama',
          hintText: 'Masukan Nama Lengkap Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/icons/User.svg",
          )),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.emailAddress,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'email',
          hintText: 'Masukan Email Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/icons/Mail.svg",
          )),
    );
  }
}
