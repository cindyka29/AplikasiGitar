import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../services/api.dart';
import 'package:flutter_application_1/models/packages.dart';

class APIPage extends StatefulWidget {
  const APIPage({Key? key}) : super(key: key);

  @override
  State<APIPage> createState() => APIPageState();
}

class APIPageState extends State<APIPage> {
  late Future<Smartglasses> _packages;
  @override
  void initState() {
    //TODO implement initState
    super.initState();
    // _packages = APIstatic.getSmartglasses() as Future<Smartglasses>;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // child: Text("TEST API"),
        appBar: AppBar(
          title: Text("Toko Gitar Keren"),
        ),
        body: FutureBuilder<List<Smartglasses>>(
          future: APIstatic.getSmartglasses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Smartglasses>? listSmartglasses = snapshot.data;
              return Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: listSmartglasses?.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {},
                    child: Container(
                      child: Row(
                        children: [
                          // Image.network("http://192.168.1.6:80/" +
                          //     listSmartglasses![index].featureImg),
                          Text(listSmartglasses![index].packageName)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            ;
          },
        ));
  }
}
