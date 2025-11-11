import 'package:flutter/material.dart';
import 'package:goalin/screens/action_menu.dart';
import 'package:goalin/screens/product_form.dart';

class LeftDrawer extends StatelessWidget {

    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context){
        return Drawer(
            child: ListView(
                children: [

                    const DrawerHeader(
                        decoration: BoxDecoration(
                            color: Color(0xFFC2E2FA)
                        ),

                        child: Column(
                            children: [
                                Text(
                                    'Goalin',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF8F8F)
                                    ),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Text("Your Football Store", textAlign: TextAlign.center)
                            ],
                        ),

                    ),

                    ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Home'),
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder:  (context) => MyHomePage()
                                )
                            );
                        },
                    ),


                     ListTile(
                        leading: const Icon(Icons.post_add),
                        title: const Text('Add Product'),
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder:  (context) => ProductFormPage()
                                )
                            );
                        },
                    )


                ],
            ),
        );
    }

}