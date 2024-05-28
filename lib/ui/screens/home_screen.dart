// import 'package:flutter/material.dart';
// import '../screens.dart';

// class HomeScreen extends StatefulWidget {
//   static const String name =
//       'home_screen'; // const para usarla llamandola con gorouter

//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// // private class
// class _HomeScreenState extends State<HomeScreen> {
//   // indice actual, que se muestra en el navbar
//   int currentIndex = 0;
//   // lista de strings, que se muestran en el titulo de las diferentes views
//   List<String> pageNames = ['Home', 'My Cart', 'Profile'];

// // consts defined
//   @override
//   Widget build(BuildContext context) {
//     final screens = [
//       const HomeView(),
//       const CartView(),
//       const ProfileView(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           title: Center(
//             child: Text(
//               pageNames[currentIndex],
//             ),
//           ),
//           surfaceTintColor: Colors.transparent),
//       body: IndexedStack(
//         index: currentIndex,
//         children: screens,
//       ),
//       extendBody: true,
//       // nav bar with 3 seccions
//       bottomNavigationBar: Container(
//         clipBehavior: Clip.hardEdge,
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(60),
//               topLeft: Radius.circular(60),
//             ),
//             boxShadow: [
//               // BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 5)
//             ]),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(60.0),
//             topRight: Radius.circular(60.0),
//           ),
//           child: NavigationBar(
//             destinations: const [
//               NavigationDestination(
//                   icon: Icon(Icons.home_outlined), label: 'Home'),
//               NavigationDestination(
//                   icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
//               NavigationDestination(
//                   icon: Icon(Icons.person_outline), label: 'Profile'),
//             ],
//             indicatorColor: Colors.white,
//             backgroundColor: Colors.white,
//             // elevation: 0,
//             selectedIndex: currentIndex,
//             // se llama cuando se seleciona una nueva pagina y actualiza "currentIndex" mostrando el titulo correspondiente
//             onDestinationSelected: (int index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce/ui/screens.dart';
import 'package:e_commerce/ui/widgets/custom_navigationbar.dart';
import 'package:flutter/material.dart';
import '../widgets/nav_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final supportNavKey = GlobalKey<NavigatorState>();
  final favoriteNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        titlebar: const Text('Home'),
        page: const HomeView(),
        navKey: homeNavKey,
      ),
      NavModel(
        titlebar: const Text('Support'),
        page: const SupportView(),
        navKey: supportNavKey,
      ),
      NavModel(
        titlebar: const Text('Favorite'),
        page: const FavoriteView(),
        navKey: favoriteNavKey,
      ),
      NavModel(
        titlebar: const Text('Profile'),
        page: const ProfileView(),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        // buttom cart middle
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 10),
          height: screenHeight * 0.058,
          width: screenWidht * 0.12,
          child: FloatingActionButton(
            splashColor: Colors.grey[900],
            backgroundColor: Colors.black,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => (const CartView())));
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab')),
    );
  }
}

// class Page extends StatelessWidget {
//   final int tab;

//   const Page({super.key, required this.tab});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(title: Text('$tab')),
//         // body: Page(tab: tab),
//         );
//   }
// }
