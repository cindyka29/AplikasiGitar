// import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/packages.dart';
import 'package:flutter_application_1/services/api.dart';
import 'package:http/http.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import '../../models/errMsg.dart';
import '../../models/kelompok.dart';

class InputPackages extends StatefulWidget {
  final Smartglasses packages;
  InputPackages({required this.packages});
  @override
  _InputPackagesState createState() => _InputPackagesState();
  // const InputPackages({Key? key, required Smartglasses packages})
  //     : super(key: key);
  // State<InputPackages> createState() => _InputPackagesState();
}

class _InputPackagesState extends State<InputPackages> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController packageName, packageId, packageCode, PackageDesc;
  late List<Kelompok> _Kelompok = [];
  late int idKelompok = 0;
  // late int idKelompok = 0;
  bool _isupdate = false;
  bool _validate = false;
  late ErrorMSG response;
  late String _status = 'N';
  void getKelompok() async {
    final Response = await APIstatic.getKelompok();
    setState(() {
      _Kelompok = Response.toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    packageName = TextEditingController();
    packageId = TextEditingController();
    packageCode = TextEditingController();
    PackageDesc = TextEditingController();
    getKelompok();
    if (widget.packages.packageName != 0) {
      // APIstatic.detailPackages(widget.id).then((packages result) {
      // packageName = widget.packages.packageName;
      // packageId = TextEditingController(text: widget.packages.packageId);
      // packageCode = TextEditingController(text: widget.packages.packageCode);
      packageName = TextEditingController(text: widget.packages.packageName);
      PackageDesc = TextEditingController(text: widget.packages.packageDesc);
      packageName = TextEditingController(text: widget.packages.nama_kelompok);
      idKelompok = widget.packages.packageId;
      // _status = widget.packages.status;
      _isupdate = true;
      // });
    }
    super.initState();
  }

  // // func submit
  // void submit() async {
  //   if (_formkey.currentState!.validate()) {
  //     _formkey.currentState!.save();
  //     var params = {
  //       "packageName": packageName.toString(),
  //       "packageId": packageId.toString(),
  //       "packageCode": packageCode.toString(),
  //       "packageDesc": PackageDesc.toString(),
  //       "idKelompok": idKelompok.toInt()
  //     };
  //     response = await APIstatic.save(idKelompok, params);
  //     _success = response.success;
  //     final SnackBar = SnackBar(
  //       content: Text(response.message),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     if (_success) {
  //       Navigator.of(context).pushReplacement(new MaterialPageRoute(
  //         builder: BuildContext context) => widget());
  //     } else {}
  //   } else {
  //     _validate = true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate ? Text("Ubah Data") : Text('Input Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: packageName,
                  // validator: (u) => u == "" ? "Wajib Diisi" : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Nama Gitar',
                    labelText: 'Nama Gitar',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: packageId,
                  // validator: (u) => u == "" ? "Wajib Diisi" : null,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.assignment_ind),
                    hintText: 'Kode Gitar',
                    labelText: 'Kode Gitar',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownButtonFormField(
                  value: idKelompok == 0 ? null : idKelompok,
                  hint: Text("Pilih Kelompok"),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.category_rounded),
                  ),
                  items: _Kelompok.map((item) {
                    return DropdownMenuItem(
                      child: Text(item.namakelompok),
                      value: item.idkelompok.toInt(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      idKelompok = value as int;
                    });
                  },
                  validator: (u) => u == null ? "Wajib Diisi" : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: packageCode,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Id Gitar',
                    labelText: 'Id Gitar',
                  ),
                  // validator: (u) => u == "" ? "Wajib Diisi" : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: PackageDesc,
                  keyboardType: TextInputType.multiline,
                  // validator: (u) => u == "" ? "Wajib Diisi" : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: 'Desc Gitar',
                    labelText: 'Desc Gitar',
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        value: "Y",
                        groupValue: _status,
                        onChanged: (String? newValue) {
                          setState(() {
                            _status = newValue!.toString();
                          });
                        },
                      ),
                      new Text('Aktif'),
                      new Radio(
                        value: "N",
                        groupValue: _status,
                        onChanged: (String? newValue) {
                          setState(() {
                            _status = newValue!.toString();
                          });
                        },
                      ),
                      new Text('Tidak'),
                    ],
                  )),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (
                      // Navigator.push(context, MaterialPageRoute)
                      ) {},
                  child: Text(
                    'SIMPAN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
