import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:my_first_project/Screens/firebaseForgotpassword-screen.dart';
import 'package:my_first_project/Screens/firebasedashboard-screen.dart';
import 'package:my_first_project/Screens/firebseEmailverification.dart';
import 'package:my_first_project/Screens/sign%20up%20screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailC = TextEditingController();
  var passC = TextEditingController();

  bool loggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [

            TextField(
              controller: emailC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
            const Gap(16),
            TextField(
              controller: passC,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const ForgotPasswordScreen();
                  }));
                }, child: const Text('Forgot Password?'))),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {


                  String email = emailC.text.trim();
                  String pass = passC.text.trim();

                  loggingIn = true;
                  setState(() {

                  });
                try{


                  FirebaseAuth fbAuth = FirebaseAuth.instance;
                  UserCredential userC = await fbAuth.signInWithEmailAndPassword(email: email, password: pass);

                  if( userC.user != null ){

                    if( userC.user!.emailVerified){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return const DashboardScreen();
                      }));
                    }else {

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return const EmailVerificationScreen();
                      }));
                    }


                  }
                }
                on FirebaseAuthException catch ( e){

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString()))
                  );
                }finally {
                  loggingIn = false;
                  setState(() {

                  });
                }


                }, child: loggingIn ?
                const SpinKitCircle(color: Colors.white,)
                : const Text('LOGIN')),

            const Gap(16),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const SignUpScreen();
              }));

            }, child: const Text('Not Registered Yet? SignUp Now'))

          ],
        ),
      ),
    );
  }
}