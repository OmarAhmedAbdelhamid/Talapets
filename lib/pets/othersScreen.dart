import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart';

class SellOthersScreen extends StatelessWidget {
  const SellOthersScreen({super.key});

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
            'Sell Others',
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
                        title: 'Rabbit',
                        description: 'Description of Product 1',
                        price: '\$100',
                        imageUrl: 'assets/Other_Products/rabbit.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Champanzee',
                        description: 'Description of Product 2',
                        price: '\$250',
                        imageUrl: 'assets/Other_Products/champanzee.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Horse',
                        description: 'Description of Product 3',
                        price: '\$1500',
                        imageUrl: 'assets/Other_Products/horse.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Snake',
                        description: 'Description of Product 4',
                        price: '\$600',
                        imageUrl: 'assets/Other_Products/snake.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Eagle',
                        description: 'Description of Product 5',
                        price: '\$1800',
                        imageUrl: 'assets/Other_Products/eagle.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Hamster',
                        description: 'Description of Product 6',
                        price: '\$100',
                        imageUrl: 'assets/Other_Products/hamster.jpg',
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
