import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goalin/screens/action_menu.dart';
import 'package:goalin/utils/goalin_colors.dart';
import 'package:goalin/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget{
    const ProductFormPage({super.key});


    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage>{

    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    int _stock = 0;
    String _desc = "";
    String _thumbnail = "";
    String _category = "outdoor";
    bool _isFeatured = false;

    final _categories = const {
        'outdoor': 'Outdoor Items',
        'indoor': 'Indoor Items'
    };
    
    @override
    Widget build(BuildContext context){
        final request = context.watch<CookieRequest>();

        return Scaffold(
            appBar: AppBar(
                title: const Center(
                    child: Text('Form Add Product', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
            ),
            drawer: LeftDrawer(),
            body: Form(
                key: _formKey, // handler form state, validasi form, penyimpanan form
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            // NAME PRODUCT

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Nama Produk",
                                        labelText: "Nama Produk",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        )
                                    ),

                                    onChanged: (String? value){
                                        setState(() {
                                          _name = value!;
                                        });
                                    },

                                    validator: (String? value){
                                        if(value == null || value.isEmpty){
                                            return "Nama Produk tidak boleh kosong!";
                                        }

                                        if(value.length > 50){
                                            return "Nama produk maksimum 50 karakter!";
                                        }

                                        return null;

                                    },

                                ),
                            ),

                            //  PRICE PRODUCT
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Harga Produk",
                                        labelText: "Harga Produk",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        )
                                    ),

                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    onChanged: (value){
                                        setState(() {
                                          _price = int.tryParse(value) ?? 0;
                                        });
                                    },

                                    validator: (value){
                                        if(value == null || value.isEmpty){
                                            return "Harga Produk tidak boleh kosong!";
                                        }

                                        if(int.tryParse(value)! <= 0){
                                            return "Harga produk tidak boleh nol";
                                        }

                                        return null;

                                    },

                                ),
                            ),

                            //  Stock PRODUCT
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Stok Produk",
                                        labelText: "Stok Produk",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        )
                                    ),

                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    onChanged: (value){
                                        setState(() {
                                          _stock = int.tryParse(value) ?? 0;
                                        });
                                    },

                                    validator: (value){
                                        if(value == null || value.isEmpty){
                                            return "Harga Produk tidak boleh kosong!";
                                        }

                                        if(int.tryParse(value)! <= 0){
                                            return "Harga produk tidak boleh nol";
                                        }

                                        return null;

                                    },

                                ),
                            ),

                            // DESCRIPTION 
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Deskripsi Produk",
                                        labelText: "Deskripsi Produk",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        )
                                    ),

                                    onChanged: (String? value){
                                        setState(() {
                                          _desc = value!;
                                        });
                                    },

                                    validator: (String? value){
                                        if(value == null || value.isEmpty){
                                            return "Deskripsi Produk tidak boleh kosong!";
                                        }
                                        return null;

                                    },

                                ),
                            ),
                            
                            // CATEGORIES 
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                        hintText: "Kategori",
                                        labelText: "Kategori",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        )
                                    ),
                                    
                                    initialValue: _category,
                                    items: _categories.entries.map(
                                        (entry) => DropdownMenuItem<String>(
                                            value: entry.key,
                                            child: Text(entry.value),
                                        )
                                    ).toList(),

                                    onChanged: (String? value){
                                        setState(() {
                                          _category = value!;
                                        });
                                    },

                                    validator: (String? value){
                                        if(value == null || value.isEmpty){
                                            return "Kategori Produk tidak boleh kosong!";
                                        }

                                        if(!_categories.containsKey(value)){
                                            return "Kategori Produk tidak valid";
                                        }

                                        return null;

                                    },
                                    

                                ),
                            ),

                            // THUMBNAIL 
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Thumbnail Produk",
                                        labelText: "Thumbnail Produk",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        )
                                    ),

                                    onChanged: (String? value){
                                        setState(() {
                                          _thumbnail = value!;
                                        });
                                    },

                                    validator: (String? value){
                                        
                                        final uriCheck = Uri.tryParse(value!);
                                        if(uriCheck == null || !uriCheck.hasScheme || !uriCheck.hasAuthority){
                                            return "Periksa URL thumbnail anda kembali";
                                        }


                                        return null;

                                    },

                                ),
                            ),

                            // Is Featured 
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SwitchListTile(
                                    title: const Text("Produk Unggulan"),
                                    
                                    value: _isFeatured,
                                    onChanged: (bool value) {
                                        setState(() {
                                            _isFeatured = value;
                                        });
                                    },
                                ),
                            
                            ),


                            // SIMPANN

                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(appColors['first']),
                                    ),
                                    onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          final response = await request.postJson(
                                          "http://localhost:8000/create-product-flutter/",
                                          jsonEncode({
                                            "name": _name,
                                            "description": _desc,
                                            "price": _price,
                                            "stock": _stock,
                                            "thumbnail": _thumbnail,
                                            "category": _category,
                                            "is_featured": _isFeatured,
                                          }),
                                        );
                                        if (context.mounted) {
                                          if (response['status'] == 'success') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text("Product successfully created!"),
                                            ));
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => MyHomePage()),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text("Something went wrong, please try again."),
                                            ));
                                          }
                                        }
                                      }
                                    },
                                    child: const Text(
                                        "Simpan",
                                        style: TextStyle(color: Colors.white),
                                    ),
                                    ),
                                ),
                            ),

                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(appColors['third']),
                                      ),
                                      onPressed: () {
                                          Navigator.pop(context);
                                      },
                                      child: const Text(
                                          "Back",
                                          style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                ),
                            ),

                        ],
                    ),


                ), // membuat scrollable

            ),
        );
    }
}