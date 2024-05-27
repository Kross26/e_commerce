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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 4,
            toolbarHeight: screenHeight * 0.1,
            backgroundColor: Colors.white,
            title: const Center(
              child: Text('Home'),
            ),
            leading: const Icon(Icons.widgets_outlined),
            actions: [
              SizedBox(
                  width: screenWidht * 0.12,
                  child: const Icon(
                    Icons.notifications_outlined,
                  )),
            ],
          ),
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
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                // borderSide: BorderSide(width: 30),
                              ),
                              filled: true,
                              hintText: "Seach product",
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[500],
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
                              color: Colors.black),
                          child: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
          )),
    );
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
