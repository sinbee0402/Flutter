import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  int currentPageIndex = 0;

  CustomBottomNavigation({
    Key? key,
    required this.currentPageIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_mall_outlined),
          label: 'mall',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'user',
        ),
      ],
      selectedItemColor: const Color(0xff6B69C7),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.currentPageIndex,
      type: BottomNavigationBarType.fixed,
    );
  }
}
