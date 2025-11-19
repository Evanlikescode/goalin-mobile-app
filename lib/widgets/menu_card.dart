import 'package:flutter/material.dart';
import 'package:goalin/screens/login.dart';
import 'package:goalin/screens/product_entry_list.dart';
import 'package:goalin/screens/product_entry_my_list.dart';
import 'package:goalin/screens/product_form.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ButtonHomePage{
    final String name;
    final IconData icon;
    final Color color;

    ButtonHomePage(this.name, this.icon, this.color);
}

class ButtonAction extends StatelessWidget{

    final ButtonHomePage buttonHome;

    const ButtonAction(this.buttonHome, {super.key});
    @override
    Widget build(BuildContext context){
        final request = context.watch<CookieRequest>();
        return Material(
            color: buttonHome.color,
            borderRadius: BorderRadius.circular(25),
            elevation: 20.0,
            child: InkWell(
                onTap: () async {
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Kamu telah menekan tombol ${buttonHome.name} "))
                        );

                        if(buttonHome.name == "Create Product"){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductFormPage()));
                        } else if(buttonHome.name == "Logout"){
                            final response = await request.logout(
                                "http://localhost:8000/auth/logout/");
                            String message = response["message"];
                            if (context.mounted) {
                                if (response['status']) {
                                    String dataUsername = response["username"];
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("$message See you again, $dataUsername."),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginPage()),
                                    );
                                } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(message),
                                        ),
                                    );
                                }
                            }
                        } else if (buttonHome.name == "All Products"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductEntryListPage()));

                        } else if (buttonHome.name == "My Products"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductEntryListMyPage()));
                          
                        }
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(
                                    buttonHome.icon,
                                    color: Colors.white,
                                    size: 25.0,
                                ),
                                const Padding(padding: EdgeInsets.all(3)),
                                Text(
                                    buttonHome.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                )
                            ],
                        ),
                    ),
                ),
            ),

        );
    }

}