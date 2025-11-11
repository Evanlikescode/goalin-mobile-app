import 'package:flutter/material.dart';
import 'package:goalin/screens/product_form.dart';

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
        return Material(
            color: buttonHome.color,
            borderRadius: BorderRadius.circular(25),
            elevation: 20.0,
            child: InkWell(
                onTap: () {
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Kamu telah menekan tombol ${buttonHome.name} "))
                        );

                        if(buttonHome.name == "Create Product"){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductFormPage()));
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