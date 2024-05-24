import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      elevation: 0.0,
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          children: [
            navItem(
              Icons.home_outlined,
              pageIndex == 0,
              onTap: () => onTap(0),
            ),
            navItem(
              Icons.message_outlined,
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
            navItem(
              Icons.favorite_border_outlined,
              pageIndex == 2,
              onTap: () => onTap(2),
            ),
            navItem(
              Icons.person_2_outlined,
              pageIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
      child: InkWell(
    onTap: onTap,
    child: Icon(
      icon,
      color: selected ? Colors.blue[900] : Colors.black,
    ),
  ));
}
