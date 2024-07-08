import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/ui/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
