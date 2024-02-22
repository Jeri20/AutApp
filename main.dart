import 'package:flutter/material.dart';
import 'package:grocery_store_app/database_helper.dart';
import 'package:grocery_store_app/product.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(GroceryStoreApp());
}

class GroceryStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue).copyWith(
          background: Color.fromARGB(255, 30, 40, 47),
        ),
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvailableProductsScreen(),
                  ),
                );
              },
              child: Text('Items'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              child: Text('My List'),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          ProductButton(name: 'Apple', imagePath: "lib/pics/002-apple.png"),
          ProductButton(name: 'Banana', imagePath: "lib/pics/001-banana.png"),
          ProductButton(name: 'Orange', imagePath: "lib/pics/003-orange.png"),
          ProductButton(name: 'Mango', imagePath: "lib/pics/004-mango.png"),
          ProductButton(
              name: 'Strawberry', imagePath: "lib/pics/005-strawberry.png"),
          ProductButton(name: 'Grapes', imagePath: "lib/pics/006-grapes.png"),
          ProductButton(
              name: 'Watermelon', imagePath: "lib/pics/007-watermelon.png"),
          ProductButton(
              name: 'Pineapple', imagePath: "lib/pics/008-pineapple.png"),
          ProductButton(name: 'Carrot', imagePath: "lib/pics/009-carrot.png"),
          ProductButton(name: 'Potato', imagePath: "lib/pics/010-potato.png"),
          ProductButton(name: 'Tomato', imagePath: "lib/pics/011-tomato.png"),
          ProductButton(name: 'Onion', imagePath: "lib/pics/012-onion.png"),
          ProductButton(
              name: 'Cucumber', imagePath: "lib/pics/013-cucumber.png"),
          ProductButton(name: 'Spinach', imagePath: "lib/pics/014-spinach.png"),
          ProductButton(name: 'Lettuce', imagePath: "lib/pics/015-lettuce.png"),
          ProductButton(name: 'Broccoli', imagePath: "lib/pics/017-food.png"),
          ProductButton(
              name: 'Bell Pepper', imagePath: "lib/pics/018-bell-pepper.png"),
          ProductButton(
              name: 'Cabbage', imagePath: "lib/pics/016-lettuce-1.png"),
          ProductButton(name: 'Rice', imagePath: "lib/pics/019-rice.png"),
          ProductButton(name: 'Pasta', imagePath: "lib/pics/020-spaguetti.png"),
          ProductButton(name: 'Bread', imagePath: "lib/pics/021-bread.png"),
          ProductButton(name: 'Milk', imagePath: "lib/pics/022-milk.png"),
          ProductButton(name: 'Eggs', imagePath: "lib/pics/023-boiled-egg.png"),
          ProductButton(name: 'Butter', imagePath: "lib/pics/024-butter.png"),
          ProductButton(name: 'Cheese', imagePath: "lib/pics/025-cheese.png"),
          ProductButton(name: 'Yogurt', imagePath: "lib/pics/026-yogurt.png"),
          ProductButton(
              name: 'Chicken', imagePath: "lib/pics/027-chicken-leg.png"),
          ProductButton(name: 'Beef', imagePath: "lib/pics/028-beef.png"),
          ProductButton(name: 'Fish', imagePath: "lib/pics/029-fish.png"),
          ProductButton(name: 'Shrimp', imagePath: "lib/pics/030-shrimp.png"),
          ProductButton(name: 'Soap', imagePath: "lib/pics/032-soap.png"),
          ProductButton(name: 'Shampoo', imagePath: "lib/pics/031-shampoo.png"),
          ProductButton(
              name: 'Toothpaste', imagePath: "lib/pics/033-toothpaste.png"),
          ProductButton(
              name: 'Toothbrush', imagePath: "lib/pics/034-toothbrush.png"),
          ProductButton(
              name: 'Detergent', imagePath: "lib/pics/035-detergent.png"),
          ProductButton(
              name: 'Cleaning Spray',
              imagePath: "lib/pics/036-cleaning-spray.png"),
          ProductButton(
              name: 'Paper Towels', imagePath: "lib/pics/037-paper-towel.png"),
          ProductButton(
              name: 'Toilet Paper', imagePath: "lib/pics/038-toilet-paper.png"),
          ProductButton(name: 'Trash Bags', imagePath: "lib/pics/039-bags.png"),
          ProductButton(
              name: 'Aluminum Foil',
              imagePath: "lib/pics/040-aluminium-paper.png"),
          ProductButton(
              name: 'Plastic Wrap', imagePath: "lib/pics/041-plastic-film.png"),
          ProductButton(
              name: 'Dish Soap', imagePath: "lib/pics/042-dish-soap.png"),
          // Add other ProductButton widgets here
        ],
      ),
    );
  }
}

class ProductButton extends StatelessWidget {
  final String name;
  final String imagePath;

  const ProductButton({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          _addToCart(context, name);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
            ),
            SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, String productName) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.insertProduct(Product(
      name: productName,
    ));
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: FutureBuilder<List<Product>>(
        future: databaseHelper.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('No items in the cart'));
          } else {
            Map<String, int> productCounts = {};
            snapshot.data!.forEach((product) {
              if (productCounts.containsKey(product.name)) {
                productCounts[product.name] = productCounts[product.name]! + 1;
              } else {
                productCounts[product.name] = 1;
              }
            });

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productCounts.length,
                    itemBuilder: (context, index) {
                      String productName = productCounts.keys.elementAt(index);
                      int count = productCounts[productName]!;
                      return ListTile(
                        title: Text(
                          '$productName x$count',
                          style: TextStyle(
                            color: Color.fromARGB(255, 195, 199, 201),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _clearCart(context, databaseHelper);
                  },
                  child: Text('Clear Cart'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _clearCart(BuildContext context, DatabaseHelper databaseHelper) {
    databaseHelper.clearCart().then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CartScreen(),
        ),
      );
    });
  }
}
