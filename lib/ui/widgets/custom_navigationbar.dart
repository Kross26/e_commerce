import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final NotchedShape? shape;
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
    this.shape = const CircularNotchedRectangle(),
  });

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidht = MediaQuery.of(context).size.width;
    return BottomAppBar(
      color: Colors.grey,
      shadowColor: Colors.black,
      shape: shape,
      surfaceTintColor: Colors.red,
      padding: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            label: 'Account',
          ),
        ],
      ),
      // elevation: 0.0,
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Row(
      //       children: [
      //         navItem(
      //           Icons.home_outlined,
      //           pageIndex == 0,
      //           onTap: () => onTap(0),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         navItem(
      //           Icons.message_outlined,
      //           pageIndex == 1,
      //           onTap: () => onTap(1),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         navItem(
      //           Icons.favorite_border_outlined,
      //           pageIndex == 2,
      //           onTap: () => onTap(2),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         navItem(
      //           Icons.person_2_outlined,
      //           pageIndex == 3,
      //           onTap: () => onTap(3),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return InkWell(
    // highlightColor: Colors.black,
    hoverColor: Colors.grey,
    focusColor: Colors.blue,
    splashColor: Colors.grey,
    borderRadius: BorderRadius.circular(20),
    onTap: onTap,
    // responsive design
    child: SizedBox.fromSize(
      size: const Size.fromRadius(12),
      child: FittedBox(
        child: Icon(
          icon,
          color: selected ? Colors.black : Colors.white,
        ),
      ),
    ),
  );
}
