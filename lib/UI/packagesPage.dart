import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/PPL/inputPackages.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/UI/detailPackagesPage.dart';
// import 'package:flutter_application_1/UI/homePage.dart';
// import 'package:flutter_application_1/UI/homePage.dart';
import 'package:flutter_application_1/UI/widget/buttomBar.dart';
// import 'package:flutter_application_1/models/kelompok.dart';
import 'package:flutter_application_1/models/packages.dart';
import 'package:flutter_application_1/services/api.dart';

class packagesPage extends StatefulWidget {
  const packagesPage({Key? key}) : super(key: key);

  @override
  State<packagesPage> createState() => _packagesPageState();
}

class _packagesPageState extends State<packagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Packages"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InputPackages(
                              packages: Smartglasses(
                            packageId: 0,
                            packageCode: 0,
                            packageName: '',
                            permalink: '',
                            packageDesc: '',
                            featureImg: '',
                            locationId: '',
                            comunityId: '',
                            nama_kelompok: '',
                          ))));
            }),
        body: FutureBuilder<List<Smartglasses>>(
            future: APIstatic.getSmartglasses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                List<Smartglasses> listSmarglasses = snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    detailPackagesPage(
                                      packages: listSmarglasses[index],
                                    )));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.lightGreenAccent)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  // APIstatic.host +
                                  //     '/' +
                                  "http://3.bp.blogspot.com/-wlqlHvZzwDg/VVcLRGa9FiI/AAAAAAAAKOU/BrxTV-tznKo/s1600/gambar%2Bgitar%2B(11).jpg",
                                  width: 50,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    children: [
                                      Text(listSmarglasses[index].packageName),
                                      Text(
                                        listSmarglasses[index].packageDesc,
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
        bottomNavigationBar: buildBottomBar(1, context));
  }
}
