import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/Home/HomeForm.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/productlist.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/utils/constants.dart';
import '../../pages/products.dart';

class HomeComponent extends StatefulWidget {
  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeForm(),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  List<Product> _products = [
    Product(
      name: 'Guitar 1',
      images: 'assets/images/guitar1.png',
      description: '500k',
      category: '',
      code: '',
    ),
    Product(
      name: 'Guitar 2',
      images: 'assets/images/guitar2.png',
      description: '350',
      category: 'Good Quality',
      code: '001',
    ),
    Product(
      name: 'Guitar 3',
      images: 'assets/images/guitar3.png',
      description: '270',
      category: '',
      code: '',
    ),
    Product(
      name: 'Guitar 4',
      images: 'assets/images/guitar4.png',
      description: '250',
      category: '',
      code: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(10),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (query) {
                  // Handle search query here
                },
              ),
            ),
          ),
        ],
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
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: _products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // ProductList(
                            //   products: _products[index]),
                            ProductList(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(_products[index].images),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Text(
                            _products[index].name,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Text(
                            '\$${_products[index].price}',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kTextColor,
        backgroundColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
