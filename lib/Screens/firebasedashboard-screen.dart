import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/firebaseLogin-screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      }, child: const Icon(Icons.add,),),
      appBar: AppBar(
        backgroundColor: Colors.green,

        title: const Text('Dashboard'),
        actions: [
          
          IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
          IconButton(onPressed: (){

            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: const Text('Confirmation'),
                content: const Text('Are you sure to Log Out ?'),

                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text('No')),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();

                    FirebaseAuth.instance.signOut();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const LoginScreen();
                    }));

                  }, child: const Text('Yes')),
                ],
              );
            });



          }, icon: const Icon(Icons.logout )),

        ],
      
      ),
    );
  }
}