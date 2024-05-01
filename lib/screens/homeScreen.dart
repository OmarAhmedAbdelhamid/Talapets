import 'package:flutter/material.dart';
import 'package:talapets/screens/categoriesScreen.dart';
import 'package:talapets/screens/profile.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        child: Homescreen(),
      ),
    ),
  );
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _navIcon = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: OnlineShoppingApp(),
      bottomNavigationBar: bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff95654E),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: const Color(0xffE3B68D),
      title: Image.asset(
        "assets/images/logo.png",
        height: 80,
        width: 180,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            icon: const Icon(Icons.perm_identity_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ProfileScreen();
                }),
              );
            },
            color: Color.fromARGB(255, 5, 5, 5))
      ],
    );
  }

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
        if (index == 4) {
          index = 4;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesScreen()),
          );
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "explore"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "sell"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "for you"),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "categories",
        ),
      ],
    );
  }
}

class OnlineShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'hungry cat', price: 20, image: 'assets/images/cat1.jpg'),
    Product(name: 'stunt cat', price: 20, image: 'assets/images/cat2.jpg'),
    Product(name: 'cute dog', price: 30, image: 'assets/images/dog1.jpg'),
    Product(name: 'drunk dog', price: 40, image: 'assets/images/dog2.jpg'),
    Product(name: 'funny horse', price: 50, image: 'assets/images/horse1.jpg'),
    Product(name: 'lazy horse', price: 50, image: 'assets/images/horse2.jpg'),
    Product(name: 'serious owl', price: 50, image: 'assets/images/owl.jpg'),
    Product(name: 'idiot goat', price: 50, image: 'assets/images/goat.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              product: products[index],
              imageUrl: '',
            );
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product, required String imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 215, 183, 144),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            product.image,
            fit: BoxFit.cover,
            height: 90,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 40, 39)),
              ),
              const SizedBox(height: 5),
              Text(
                '\$${product.price.toString()}', // eh dah
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 93, 45, 43)),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('View Details',
                  style: TextStyle(fontSize: 18, fontFamily: 'Caveat')),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff95654E),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
