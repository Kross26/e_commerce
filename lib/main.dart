import 'package:e_commerce/ui/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // go router
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'E-Commerce',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
