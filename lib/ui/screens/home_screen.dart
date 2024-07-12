import 'package:e_commerce/ui/screens.dart';
import 'package:e_commerce/ui/widgets/custom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/bloc_cart/cart_bloc.dart';
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
        page: const ProfileScreen(),
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
        backgroundColor: Colors.grey.shade300,
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
        // btn carrito
        // todo
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 10),
          height: screenHeight * 0.058,
          width: screenWidht * 0.12,
          child: FloatingActionButton(
            heroTag: "btn1",
            splashColor: Colors.grey[900],
            backgroundColor: Colors.black,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => (const CartScreen())));
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Badge(
                  value: state.products.length.toString(),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
        extendBody: true,
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

// numero de productos agregados al carrito
class Badge extends StatelessWidget {
  final String value;
  final Widget child;

  const Badge({super.key, required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 0,
          child: CircleAvatar(
            radius: 0,
            backgroundColor: Colors.red,
            child: Text(
              value,
              style: const TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}
