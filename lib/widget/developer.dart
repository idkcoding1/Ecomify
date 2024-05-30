import 'package:flutter/material.dart';

Widget _buildDeveloperCard({required String image, required String name}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200], // Set a background color for the card
      borderRadius: BorderRadius.circular(10.0), // Rounded corners
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 40.0, // Adjust image size
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
