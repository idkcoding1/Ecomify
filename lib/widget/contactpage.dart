import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color(0xffc47726), // Set your desired app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading with a decorative underline
            Text(
              'Get in touch!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16), // Add some space after the heading

            // Row for Images with names below
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!, // Set border color
                          width: 2.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(50.0), // Round corners
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/sehto.png'),
                        radius: 45.0, // Adjust image size
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Furqan Sehto',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!, // Set border color
                          width: 2.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(50.0), // Round corners
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/frank.png'),
                        radius: 45.0, // Adjust image size
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Muhammad Tanveer',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.info, color: Colors.blue), // Add an info icon
                const SizedBox(width: 10.0),
                Text(
                  'We\'re here to help!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.blue), // Add an email icon
                SizedBox(width: 10.0),
                Text(
                  'Email: support@ecomify.com',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.blue), // Add a phone icon
                SizedBox(width: 10.0),
                Text(
                  'Phone: +923134223823',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(thickness: 1.0, color: Colors.grey),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () =>
                      launchUrl(Uri.parse('https://www.facebook.com/')),
                  color: Colors.blue,
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(Icons
                      .mail), // Replace with the appropriate icon for Twitter
                  onPressed: () => launchUrl(Uri.parse('https://gmail.com/')),
                  color: Colors.blue,
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(Icons.reddit_outlined),
                  onPressed: () =>
                      launchUrl(Uri.parse('https://www.instagram.com/')),
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
