import 'package:e_commerce/ui/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    // name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cart_view',
    // name: CartView.name,
    builder: (context, state) => const CartView(),
  ),
  GoRoute(
    path: '/profile_view',
    // name: ProfileView.name,
    builder: (context, state) => const ProfileView(),
  ),
  GoRoute(
    path: '/home_view',
    // name: HomeView.name,
    builder: (context, state) => const HomeView(),
  ),
]);
