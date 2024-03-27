import 'package:e_commerce/ui/screens.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String name = 'home_view'; //
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// funcion que obtiene datos de la API y los convierte en una lista de objetos.
class _HomeViewState extends State<HomeView> {
  late Future<List<ProductDetail>> _productFuture;
  late Future<List<String>> _futureCategory;

  @override
  void initState() {
    _productFuture = ApiHelper.getProduct(context);
    _futureCategory = ApiHelper.getProductCategory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List>(
          future: Future.wait([_productFuture, _futureCategory]),
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
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              hintText: "Seach product",
                              fillColor: Colors.grey[200],
                              hintStyle: TextStyle(
                                color: Colors.grey[800],
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[800],
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => _show(context, snapshot.data![1]),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200]),
                          child: const Icon(Icons.filter_list),
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
                    itemCount: snapshot.data![0].length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![0][index];
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

  void _show(BuildContext ctx, List<String> lstcategories) {
    showModalBottomSheet(
      elevation: 10,
      context: ctx,
      builder: (ctx) => Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: lstcategories.length,
          itemBuilder: (context, index) {
            String categoryName = lstcategories[index];
            return ListTile(
              onTap: () async {
                _productFuture =
                    ApiHelper.getProductbyCategory(context, categoryName);
                setState(() {});
                Navigator.pop(context);
              },
              leading: const Icon(Icons.category),
              title: Text(lstcategories[index]),
            );
          },
        ),
      ),
    );
  }
}
