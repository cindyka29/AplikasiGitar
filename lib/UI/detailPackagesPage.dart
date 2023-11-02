import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/packages.dart';

class detailPackagesPage extends StatefulWidget {
  detailPackagesPage({required this.packages});
  final Smartglasses packages;

  @override
  _detailPackagesPageState createState() => _detailPackagesPageState();
}

class _detailPackagesPageState extends State<detailPackagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.packages.packageName),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Image.network(widget.packages.featureImg),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
              ),
              child: Text(
                widget.packages.packageId as String,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue,
              width: double.infinity,
              height: double.infinity,
              child: new Text(widget.packages.packageDesc),
            )
          ],
        ),
      ),
    );
  }
}
