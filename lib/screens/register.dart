import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goalin/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:goalin/utils/goalin_colors.dart';
void main(){
  runApp(const RegisterApp());
}


class RegisterApp extends StatelessWidget{

  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Register',
      theme:  ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: RegisterPage(),
    );
  }
}


class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}


class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context){

    final request = context.watch<CookieRequest>();

    return Scaffold(
      body: Center(

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Register', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 30.0,),

                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))
                      ),
                      contentPadding: EdgeInsets.all(16.0)
                    ),

                    validator: (String? value){
                      if (value == null || value.isEmpty){
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    
                  ),

                  const SizedBox(height: 15.0,),

                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.all(16.0),
                    ),
                    obscureText: true,

                    validator: (String? value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12.0,),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.all(16.0),
                    ),
                    obscureText: true,

                    validator: (String? value) {
                      if(value == null || value.isEmpty){
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20.0,),

                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      final response = await request.postJson(
                        "http://localhost:8000/auth/register/", 
                        jsonEncode(
                          {
                            'username': username,
                            'password_1': password,
                            'password_2': confirmPassword
                          }
                        )
                      );

                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: appColors['fourth'],
                      padding: EdgeInsets.all(16.0)
                    ),

                    child: const Text("Register"),

                  ),

                 


                ],
              ),
            ),
          ),
        )

      )

    );
  }

}