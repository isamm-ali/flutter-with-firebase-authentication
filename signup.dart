import 'package:authfirebase/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authfirebase/signin.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController gmail = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: gmail,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter your Gmail",
                    labelText: "Gmail",
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    hintStyle: const TextStyle(color: Colors.white54),
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 2.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 3),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: password,
                  obscureText: obscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white70,
                      ),
                    ),
                    hintText: "Create a password",
                    labelText: "Password",
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    hintStyle: const TextStyle(color: Colors.white54),
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 2.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 3),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      if (gmail.text.isEmpty || password.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in all fields')),
                        );
                        return;
                      }

                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: gmail.text.trim(),
                          password: password.text.trim(),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const homescreen()),
                        );
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message.toString())),
                        );
                      }
                    },

                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const signin()),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
