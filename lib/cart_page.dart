import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/cart_management.dart';
import 'package:project/product_page.dart';
import 'package:project/widget/drawer.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0, // Set the font size
          ),
        ),
        backgroundColor: Color(0xffc47726),
      ),
      drawer: AppDrawer(),
      body: Consumer<Cart>(
        builder: (context, cart, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var item in cart.items)
                  CartItem(
                    product: item,
                  ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a promo code',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Subtotal: \$${cart.calculateTotal().toStringAsFixed(2)}'),
                Text('Shipping: Calculated at the next step'),
                Text('Total: \$${cart.calculateTotal().toStringAsFixed(2)}'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle confirm purchase
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor:
                          Color(0xffc47726) // Set button background color
                      ),
                  child: Text(
                    'CONFIRM PURCHASE',
                    style: TextStyle(
                      fontSize: 20.0, // Set the font size
                      color: Color(0xffffffff), // Set the text color
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffc47726),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 2, // Set the current index to 2 for Cart
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context); // Navigate back if Back is tapped
          } else if (index == 2) {
            // Do nothing, we are already in the cart page
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);

    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.network(
          product.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cart.decrementItem(product);
              },
            ),
            Text('${product.quantity}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cart.incrementItem(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
