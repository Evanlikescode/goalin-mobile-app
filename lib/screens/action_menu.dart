import 'package:flutter/material.dart';
import 'package:goalin/widgets/left_drawer.dart';
import 'package:goalin/widgets/menu_card.dart';
import 'package:goalin/utils/goalin_colors.dart';

class MyHomePage extends StatelessWidget{
    
    
    MyHomePage({super.key});

    final String nama = "Evan";

    final List<ButtonHomePage> buttons = [
        ButtonHomePage("All Products", Icons.store, appColors['fourth']!),
        ButtonHomePage("My Products", Icons.inventory, appColors['first']!),
        ButtonHomePage("Create Product", Icons.add_circle, appColors['third']!),
    ];
    @override
    Widget build(BuildContext context){
        return Scaffold(
            
             appBar: AppBar(
                title: const Text(
                  'Goalin',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            drawer: LeftDrawer(),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                'Hi, $nama!',
                                style: TextStyle(
                                    color: Color(0xFFFF8F8F), 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 28.0,
                                ),
                            ),
                        ),

                        Column(
                            children: [

                                GridView.count(
                                    primary: true,
                                    padding: const EdgeInsets.all(34.0),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    children: buttons.map((ButtonHomePage button) {
                                        return ButtonAction(button);
                                    }).toList(),
                                )
                            ],
                        )
                        
                        
                        
                            
                    ],
                ),
                
            ),
            backgroundColor: Color(0xFFFFF1CB),

        
        );
    }


}

