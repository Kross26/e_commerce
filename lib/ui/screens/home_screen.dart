import 'package:flutter/material.dart';
import '../screens.dart';

class HomeScreen extends StatefulWidget {
  static const String name =
      'home_screen'; // const para usarla llamandola con gorouter

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// private class
class _HomeScreenState extends State<HomeScreen> {
  // indice actual, que se muestra en el navbar
  int currentIndex = 0;
  // lista de strings, que se muestran en el titulo de las diferentes views
  List<String> pageNames = ['For You', 'My Cart', 'Profile'];

// consts defined
  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeView(),
      const CartView(),
      const ProfileView(),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            pageNames[currentIndex],
          ),
        ), // segun el indice actual, muestra los titulos correspondientes
        surfaceTintColor: Colors.transparent,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      // nav bar with 3 seccions
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60),
        )),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
          indicatorColor: Colors.white,
          backgroundColor: Colors.grey[100],
          // elevation: 0,
          selectedIndex: currentIndex,
          // se llama cuando se seleciona una nueva pagina y actualiza "currentIndex" mostrando el titulo correspondiente
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
