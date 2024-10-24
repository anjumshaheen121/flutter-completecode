// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class WifiOnOffScreen extends StatefulWidget {
  @override
  _WifiOnOffScreenState createState() => _WifiOnOffScreenState();
}

class _WifiOnOffScreenState extends State<WifiOnOffScreen> {
  bool isWifiOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wi-Fi On/Off'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              isWifiOn ? Icons.wifi : Icons.wifi_off,
              size: 100,
              color: isWifiOn ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isWifiOn = !isWifiOn;
              });
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text(isWifiOn ? 'Turn Wi-Fi on' : 'Turn Wi-Fi off'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WifiOnOffScreen(),
  ));
}


