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
  List<String> pageNames = ['Home', 'Cart', 'Profile'];

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
        title: Text(pageNames[
            currentIndex]), // segun el indice actual, muestra los titulos correspondientes
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      // nav bar with 3 seccion
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        indicatorColor: Colors.white,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        selectedIndex: currentIndex,
        // se llama cuando se seleciona una nueva pagina y actualiza "currentIndex" mostrando el titulo correspondiente
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
