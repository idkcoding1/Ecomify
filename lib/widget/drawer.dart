import 'package:flutter/material.dart';
import 'package:project/create_account_screen.dart'; // Import your RegisterPage
import 'package:project/widget/contactpage.dart'; // Import your ContactUs page

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Tanveer Hamza'),
            accountEmail: Text('tanveer@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/frank.png'),
              backgroundColor: Color.fromARGB(255, 179, 114, 18),
            ),
          ),
          ListTile(
            title: Text('Register Now'),
            subtitle: Text('Register to get Access to Products'),
            trailing: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 194, 199, 187),
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: TextButton(
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
          ),
          Divider(height: 0.2),
          ListTile(
            title: Text('Contact Us'),
            trailing: IconButton(
              icon: Icon(Icons.contact_support),
              onPressed: () {
                Navigator.push(
                  context, // Use context.context for nested navigators
                  MaterialPageRoute(
                    builder: (context) => ContactUs(),
                  ),
                );
              },
              color: Colors.green,
            ),
          ),
          Divider(height: 0.2),
          ListTile(
            title: Text('Know More About Us'),
            trailing: FloatingActionButton.small(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ContactUs(), // Consider a dedicated About Us page if available
                  ),
                );
              },
              child: Icon(Icons.info),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}
