import 'package:flutter/material.dart';

class NavModel {
  final Text? titlebar;
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({
    this.titlebar,
    required this.page,
    required this.navKey,
  });
}
