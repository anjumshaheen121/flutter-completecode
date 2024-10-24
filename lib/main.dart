import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/firebaseLogin-screen.dart';
import 'package:my_first_project/Screens/firebasedashboard-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization with error handling
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Using FutureBuilder to ensure Firebase is initialized before showing the home screen
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors in Firebase initialization
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(child: Text("Error initializing Firebase")),
            );
          }
          // Check if Firebase is initialized successfully
          if (snapshot.connectionState == ConnectionState.done) {
            return FirebaseAuth.instance.currentUser != null &&
                    FirebaseAuth.instance.currentUser!.emailVerified
                ? const DashboardScreen()
                : const LoginScreen();
          }
          // While Firebase is still initializing, show a loading indicator (Splash Screen)
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
