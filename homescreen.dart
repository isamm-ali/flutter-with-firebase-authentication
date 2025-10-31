import 'package:authfirebase/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white24,
        title: Text("Home Page", style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Isam is the coolest programmer", style: TextStyle(fontSize: 25, color: Colors.white),),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signin()),
                          );
                        },
                        child: const Text("Yes", style: TextStyle(color: Colors.red,),),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("No", style: TextStyle(color: Colors.green,),),
                      ),
                    ],
                  ),
                );
              },
                icon: Icon(Icons.power_settings_new_sharp, size: 40,), color: Colors.red,)
          ],
        ),
      ),
    );
  }
}
