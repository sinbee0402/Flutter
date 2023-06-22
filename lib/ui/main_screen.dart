import 'package:clone_food_delivery/ui/components/custom_bottom_navigation.dart';
import 'package:clone_food_delivery/ui/components/custom_main_appbar.dart';
import 'package:clone_food_delivery/ui/components/elevated_btn.dart';
import 'package:clone_food_delivery/ui/components/scroll_item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: CustomMainAppbar(),
      ),
      bottomNavigationBar: CustomBottomNavigation(
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
          const SizedBox(height: 8),
          Expanded(
            child: Hero(
              tag: 'scroll_view_hero',
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // item 8개
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
                    ),
                    ScrollItem(
                      imgUrl:
                          'https://www.discoverlosangeles.com/sites/default/files/images/2019-01/laxbw-prime-1715-hor-wide.jpg?width=1600&height=1200&fit=crop&quality=78&auto=webp',
                      restaurant: '11 Mirrirs Rooftop',
                      address: ' 426 Amsterdam Ave, NY',
                      distance: 11.1,
                      foodType: 'Seafood',
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
