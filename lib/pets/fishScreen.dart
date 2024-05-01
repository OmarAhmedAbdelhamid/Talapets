import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart';

class SellFishScreen extends StatelessWidget {
  const SellFishScreen({super.key});

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
        appBar: AppBar(
          foregroundColor: Color.fromARGB(255, 135, 87, 65),
          backgroundColor: const Color(0xffE3B68D),
          title: Text(
            'Sell Fish',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Featured Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Goldfish',
                        description: 'Popular freshwater pet fish',
                        price: '\$10',
                        imageUrl: 'assets/Fish_Products/goldfish.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Betta Fish',
                        description: 'Colorful and hardy aquarium fish',
                        price: '\$15',
                        imageUrl: 'assets/Fish_Products/betta_fish.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Guppy',
                        description: 'Colorful and easy-to-care-for fish',
                        price: '\$8',
                        imageUrl: 'assets/Fish_Products/guppy.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Tetra Fish',
                        description: 'Active and schooling fish species',
                        price: '\$12',
                        imageUrl: 'assets/Fish_Products/tetra_fish.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Angelfish',
                        description: 'Graceful and vibrant aquarium fish',
                        price: '\$20',
                        imageUrl: 'assets/Fish_Products/angelfish.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Cichlid',
                        description: 'Colorful and diverse family of fish',
                        price: '\$18',
                        imageUrl: 'assets/Fish_Products/cichlid.jpg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
