import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart';

class SellCatsScreen extends StatelessWidget {
  const SellCatsScreen({super.key});

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
            'Sell Cats',
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
                        title: 'Siamese Cat',
                        description: 'Distinctive blue almond-shaped eyes',
                        price: '\$800',
                        imageUrl: 'assets/Cat_Products/siamese_cat.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Maine Coon',
                        description: 'Gentle giants with a sweet disposition',
                        price: '\$1000',
                        imageUrl: 'assets/Cat_Products/maine_coon.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Persian Cat',
                        description: 'Long-haired, beautiful, and calm breed',
                        price: '\$700',
                        imageUrl: 'assets/Cat_Products/persian_cat.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'British Shorthair',
                        description: 'Affectionate and easy-going companion',
                        price: '\$500',
                        imageUrl: 'assets/Cat_Products/british_shorthair.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Sphynx Cat',
                        description: 'Hairless and affectionate breed',
                        price: '\$1200',
                        imageUrl: 'assets/Cat_Products/sphynx_cat.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Scottish Fold',
                        description:
                            'Distinctive folded ears and playful nature',
                        price: '\$900',
                        imageUrl: 'assets/Cat_Products/scottish_fold.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Bengal Cat',
                        description: 'Energetic and playful domestic breed',
                        price: '\$600',
                        imageUrl: 'assets/Cat_Products/bengal_cat.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Russian Blue',
                        description: 'Reserved and intelligent breed',
                        price: '\$850',
                        imageUrl: 'assets/Cat_Products/russian_blue.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Ragdoll Cat',
                        description: 'Gentle and affectionate breed',
                        price: '\$750',
                        imageUrl: 'assets/Cat_Products/ragdoll_cat.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Exotic Shorthair',
                        description: 'Affectionate and calm breed',
                        price: '\$600',
                        imageUrl: 'assets/Cat_Products/exotic_shorthair.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'American Shorthair',
                        description: 'Playful and adaptable breed',
                        price: '\$1100',
                        imageUrl: 'assets/Cat_Products/american_shorthair.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Burmese Cat',
                        description: 'Social and people-oriented breed',
                        price: '\$400',
                        imageUrl: 'assets/Cat_Products/burmese_cat.jpg',
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
