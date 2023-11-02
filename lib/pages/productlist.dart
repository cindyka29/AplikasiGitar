import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/services/databasehelper.dart';
import 'package:flutter_application_1/pages/addproduct.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _productList = [];
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    List<Product> products = await dbHelper.getProducts();
    setState(() {
      _productList = products;
    });
  }

  void _deleteProduct(Product product) async {
    await dbHelper.deleteProduct(product.id!);
    setState(() {
      _productList.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          final product = _productList[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteProduct(product),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductAdd(ProductList() as Product),
            ),
          ).then((value) {
            if (value == true) {
              _loadProducts();
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
