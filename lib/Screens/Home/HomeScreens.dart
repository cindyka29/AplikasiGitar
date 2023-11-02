import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Home/HomeComponent.dart';
import 'package:flutter_application_1/pages/products.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/Components/Home/HomeForm.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Toko Gitar'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple.shade600),
              accountName: Text('Cindyka'),
              accountEmail: Text('cindyka@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                // do nothing, already in home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.screenWidth * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth),
            child: Text(
              'Daftar Gitar',
              style: TextStyle(
                fontSize: SizeConfig.screenWidth * 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenWidth * 2),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SizeConfig.screenWidth,
                crossAxisSpacing: SizeConfig.screenWidth,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.screenWidth),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/guitar.png',
                          height: SizeConfig.screenWidth * 7,
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        Text(
                          'Gitar Akustik $index',
                          style: TextStyle(
                            fontSize: SizeConfig.screenWidth * 1.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        Text(
                          'Rp 2.500.000',
                          style: TextStyle(
                            fontSize: SizeConfig.screenWidth * 1.5,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
