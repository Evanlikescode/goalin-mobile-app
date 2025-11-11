import 'package:flutter/material.dart';
import 'package:goalin/widgets/left_drawer.dart';


class MyHomePage extends StatelessWidget{
    
    
    MyHomePage({super.key});

    final String nama = "Evan";

    final List<ButtonHomePage> buttons = [
        ButtonHomePage("All Products", Icons.store, Colors.blue),
        ButtonHomePage("My Products", Icons.inventory, Colors.green),
        ButtonHomePage("Create Product", Icons.add_circle, Colors.red),
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