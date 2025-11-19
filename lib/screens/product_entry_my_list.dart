import 'package:flutter/material.dart';
import 'package:goalin/models/product.dart';
import 'package:goalin/screens/product_detail.dart';
import 'package:goalin/widgets/left_drawer.dart';
import 'package:goalin/widgets/product_entry.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListMyPage extends StatefulWidget {
  const ProductEntryListMyPage({super.key});

  @override
  State<ProductEntryListMyPage> createState() => _ProductEntryListMyPageState();
}

class _ProductEntryListMyPageState extends State<ProductEntryListMyPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    
    final response = await request.get('http://localhost:8000/json/dart/product/my/');
    
    var data = response;
    
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry My List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null || !snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product in goalin yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
          } else {
            
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
          }
          
        },
      ),
    );
  }
}