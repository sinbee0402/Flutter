import 'package:clone_food_delivery/components/bottom_navigation.dart';
import 'package:clone_food_delivery/components/custom_appbar.dart';
import 'package:clone_food_delivery/components/elevated_btn.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: CustomAppbar(),
      ),
      bottomNavigationBar: BottomNavigation(
        currentPageIndex: _selectedIndex,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.tune, color: Colors.grey),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedBtn(icon: Icons.local_pizza_outlined, food: 'Pizza'),
              ElevatedBtn(icon: Icons.set_meal, food: 'Asian'),
              ElevatedBtn(icon: Icons.fastfood_outlined, food: 'Burger'),
              ElevatedBtn(icon: Icons.cookie_outlined, food: 'Dessert'),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5, // 퍼지는 범위
                            blurRadius: 7, // 흐림 효과
                            offset: const Offset(0, 3), // 그림자 위치
                          )
                        ],
                      ),
                      // child: Column(
                      //   children: [
                      //     Row(),
                      //     Text(''),
                      //     Row(),
                      //   ],
                      // ),
                    ),
                    Positioned(
                      left: 8,
                      bottom: 5,
                      width: 150,
                      height: 200,
                      child: Image.network(
                        'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
