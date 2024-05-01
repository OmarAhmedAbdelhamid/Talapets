import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart';

class SellBirdsScreen extends StatelessWidget {
  const SellBirdsScreen({super.key});

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
            'Sell Birds',
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
                        title: 'Parakeet',
                        description: 'Small, colorful, and social bird species',
                        price: '\$30',
                        imageUrl: 'assets/Bird_Products/parakeet.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Canary',
                        description: 'Singing bird with beautiful plumage',
                        price: '\$40',
                        imageUrl: 'assets/Bird_Products/canary.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Cockatiel',
                        description: 'Friendly and intelligent pet bird',
                        price: '\$50',
                        imageUrl: 'assets/Bird_Products/cockatiel.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Lovebird',
                        description: 'Affectionate and social bird breed',
                        price: '\$45',
                        imageUrl: 'assets/Bird_Products/lovebird.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Finch',
                        description: 'Small and lively pet bird',
                        price: '\$25',
                        imageUrl: 'assets/Bird_Products/finch.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Budgerigar',
                        description: 'Commonly known as budgie or parakeet',
                        price: '\$35',
                        imageUrl: 'assets/Bird_Products/budgerigar.jpg',
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
