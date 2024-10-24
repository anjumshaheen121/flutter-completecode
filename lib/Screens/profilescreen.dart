// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true, // Make the app bar overlap the content
      body: Stack(
        children: [
          // Background profile image with a purple overlay
          Container(
            height: screenHeight *
                0.4, // Set the background height to 40% of screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/Pictures/Picture1.png'), // Add your background image path here
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.purple.withOpacity(
                  0.7), // Apply a purple overlay on the background image
            ),
          ),
          // Scrollable content starts here
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: screenHeight *
                        0.30), // Adjust position of circular avatar (moved down)
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor:
                        Colors.white, // White border around the image
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                          'assets/Pictures/Picture1.png'), // Add your avatar image path here
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Anjum Shaheen',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Hunza Heaven',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    letterSpacing: 1.5, // Slight spacing between letters
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: screenWidth, // Ensure container takes full width
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildProfileItem('Name', 'Anjum Shaheen'),
                      buildProfileItem('Email', 'anjumshaheen460@gmail.com'),
                      buildProfileItem('Password', '********'),
                      buildProfileItem('User ID', '22200'),
                      buildProfileItem('Zip Code', '08817'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
