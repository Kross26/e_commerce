import 'package:e_commerce/ui/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    // name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cart_screen',
    // name: CartView.name,
    builder: (context, state) => const CartScreen(),
  ),
  GoRoute(
    path: '/profile_screen',
    // name: ProfileView.name,
    builder: (context, state) => const ProfileScreen(),
  ),
  GoRoute(
    path: '/home_view',
    // name: HomeView.name,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: '/auth_screen',
    // name: HomeView.name,
    builder: (context, state) => const AuthScreen(),
  ),
]);
