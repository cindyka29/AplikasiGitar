import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/products.dart';
import 'package:flutter_application_1/services/databasehelper.dart';

class ProductAdd extends StatefulWidget {
  final Product _product;
  ProductAdd(this._product);

  @override
  State<ProductAdd> createState() => _ProductAddState(this._product);
}

class _ProductAddState extends State<ProductAdd> {
  final Product _product;
  _ProductAddState(this._product);
  late final nameController = TextEditingController();
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEditing = false;
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> addOrEditUser() async {
    String desc = descriptionController.text;
    String name = nameController.text;
    String code = codeController.text;

    if (!isEditing) {
      Product product = new Product(
          name: name, code: code, description: desc, category: '', images: '');
      await dbHelper.insertProduct(product);
    } else {
      _product.description = desc;
      _product.code = code;
      _product.name = name;
      _product.category = '';
      await dbHelper.updateProduct(_product);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProductPage()),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Data has been saved.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    resetData();
  }

  void resetData() {
    nameController.clear();
    descriptionController.clear();
    codeController.clear();
    isEditing = false;
  }

  @override
  void initState() {
    super.initState();
    nameController.text = _product.name;
    codeController.text = _product.code;
    descriptionController.text = _product.description;
    isEditing = (_product.id != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product name',
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: codeController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Enter Product Code',
                  labelText: 'Code',
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Description',
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: addOrEditUser,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
