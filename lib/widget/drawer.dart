// app_drawer.dart
import 'package:flutter/material.dart';
import 'package:project/create_account_screen.dart'; // Import your RegisterPage
import 'package:project/widget/contactpage.dart'; // Import your ContactUs page
import 'package:project/widget/developer.dart'; // Import your Developer page

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Tanveer Hamza'),
            accountEmail: Text('Hamzatanveer961@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurple,
            ),
          ),
          ListTile(
            title: Text('Register Now'),
            subtitle: Text('Register to get Access to Products'),
            trailing: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountScreen(),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ),
          Divider(height: 0.2),
          ListTile(
            title: Text('Contact Us'),
            trailing: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contactus(),
                  ),
                );
              },
              child: Text('Contact'),
            ),
          ),
          Divider(height: 0.2),
          ListTile(
            title: Text('Know More About Us'),
            trailing: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Developer(),
                  ),
                );
              },
              child: Text('More'),
            ),
          ),
        ],
      ),
    );
  }
}
