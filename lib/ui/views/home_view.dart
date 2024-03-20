import 'package:e_commerce/domain/entities/product_detail.dart';
import 'package:e_commerce/services/api_helper.dart';
import 'package:e_commerce/ui/widgets/product_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// funcion que obtiene datos de la API y los convierte en una lista de objetos.
class _HomeViewState extends State<HomeView> {
  late Future<List<ProductDetail>> _productFuture;

  @override
  void initState() {
    _productFuture = ApiHelper.getProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<ProductDetail>>(
          future: _productFuture,
          builder: (context, snapshot) {
            // connect to the internet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return const Center(
                child: Text("No Data"),
              );
            }

            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Data Empty"),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            hintText: "Seach product",
                            fillColor: Colors.grey[200],
                            hintStyle: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200]),
                          child: Icon(Icons.filter_list),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      // widget reusable
                      return ProductCardReusable(
                        product: product,
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
