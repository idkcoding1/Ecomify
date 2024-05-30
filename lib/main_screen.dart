import 'package:flutter/material.dart';
import 'package:project/product_page.dart';
import 'package:project/widget/drawer.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffc47726),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              'Welcome To Ecomify',
              style: TextStyle(fontSize: 30, fontFamily: 'Fredoka'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Product',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 8.0), // Adjusted height
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BannerCard(
                    imageUrl:
                        'https://t3.ftcdn.net/jpg/04/65/46/52/360_F_465465254_1pN9MGrA831idD6zIBL7q8rnZZpUCQTy.jpg',
                    width: MediaQuery.of(context).size.width / 0.8,
                  ),
                  BannerCard(
                    imageUrl:
                        'https://img.freepik.com/premium-photo/photocomposition-horizontal-shopping-banner-with-woman-big-smartphone_23-2151201773.jpg',
                    width: MediaQuery.of(context).size.width / 0.8,
                  ),
                  BannerCard(
                    imageUrl:
                        'https://t3.ftcdn.net/jpg/04/65/46/52/360_F_465465254_1pN9MGrA831idD6zIBL7q8rnZZpUCQTy.jpg',
                    width: MediaQuery.of(context).size.width / 0.8,
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.0), // Adjusted height
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 16.0,
                children: [
                  CategoryTile("men's clothing", Icons.boy, context),
                  CategoryTile('jewelery', Icons.shopping_bag, context),
                  CategoryTile("women's clothing", Icons.girl, context),
                  CategoryTile('electronics', Icons.watch_later, context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffc47726), // Set bottom bar background color
        selectedItemColor: Colors.white, // Set the color of selected item icons
        unselectedItemColor:
            Colors.white, // Set the color of unselected item icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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

Widget CategoryTile(String title, IconData icon, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductsPage(category: title),
        ),
      );
    },
    child: Card(
      elevation: 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60),
            SizedBox(height: 16),
            Text(title),
          ],
        ),
      ),
    ),
  );
}

class BannerCard extends StatelessWidget {
  final String imageUrl;
  final double width;

  BannerCard({required this.imageUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
        child: Container(
          width: width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
