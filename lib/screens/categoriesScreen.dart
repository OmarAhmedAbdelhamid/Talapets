import 'package:flutter/material.dart';
import 'package:talapets/pets/birdsScreen.dart';
import 'package:talapets/pets/catsScreen.dart';
import 'package:talapets/pets/dogsScreen.dart';
import 'package:talapets/screens/Sell.dart';
import 'package:talapets/screens/emergencyScreen.dart';
import 'package:talapets/screens/homeScreen.dart';
import 'package:talapets/models/categoryItem.dart';
import 'package:talapets/pets/fishScreen.dart';
import 'package:talapets/pets/othersScreen.dart';
import 'package:talapets/pets/turtlesScreen.dart';
import 'package:talapets/screens/profile.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _navIcon = 1;

  Widget bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 175, 130, 96),
      unselectedItemColor: const Color.fromARGB(255, 50, 44, 43),
      backgroundColor: const Color(0xffE3B68D),
      currentIndex: _navIcon,
      onTap: (index) {
        setState(() {
          _navIcon = index;
        });
        if (index == 0) {
          index = 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        }
        if (index == 3) {
          index = 3;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmergencyScreen()),
          );
        }
        if (index == 4) {
          index = 4;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
        if (index == 2) {
          index = 2;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetSalesPage()),
          );
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: "categories"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "sell"),
        BottomNavigationBarItem(
            icon: Icon(Icons.emergency_outlined), label: "emergency"),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity_outlined),
          label: "profile",
        ),
      ],
    );
  }

  final TextEditingController _searchController = TextEditingController();
  bool _showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    CategoryItem(
                      title: 'Dogs',
                      icon: AssetImage('assets/icons/Dogs.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellDogsScreen()),
                        );
                      },
                    ),
                    CategoryItem(
                      title: 'Cats',
                      icon: AssetImage('assets/icons/Cats.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellCatsScreen()),
                        );
                      },
                    ),
                    CategoryItem(
                      title: 'Turtles',
                      icon: AssetImage('assets/icons/Turtles.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellTurtlesScreen()),
                        );
                      },
                    ),
                    CategoryItem(
                      title: 'Birds',
                      icon: AssetImage('assets/icons/Birds.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellBirdsScreen()),
                        );
                      },
                    ),
                    CategoryItem(
                      title: 'Fish',
                      icon: AssetImage('assets/icons/Fish.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellFishScreen()),
                        );
                      },
                    ),
                    CategoryItem(
                      title: 'Others',
                      icon: AssetImage('assets/icons/Others.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellOthersScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff95654E),
          onPressed: () {
            setState(() {
              Navigator.of(context).pushReplacementNamed('sellPage');
            });
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: _showSearchBar
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search categories...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Perform search/filtering here
              },
            )
          : null,
      leading: !_showSearchBar
          ? IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _showSearchBar = true;
                });
              },
            )
          : null,
      actions: [
        if (_showSearchBar)
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                _showSearchBar = false;
                _searchController.clear();
              });
            },
          ),
      ],
      backgroundColor: const Color(0xffE3B68D),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
