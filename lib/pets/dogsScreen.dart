import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart';

class SellDogsScreen extends StatelessWidget {
  const SellDogsScreen({super.key});

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
            'Sell Dogs',
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
                        title: 'Golden Retriever',
                        description: 'Friendly and intelligent dog breed',
                        price: '\$800',
                        imageUrl: 'assets/Dog_Products/golden_retriever.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'German Shepherd',
                        description: 'Loyal and versatile working dog',
                        price: '\$1000',
                        imageUrl: 'assets/Dog_Products/german_shepherd.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Labrador Retriever',
                        description: 'Energetic and outgoing family dog',
                        price: '\$700',
                        imageUrl: 'assets/Dog_Products/labrador_retriever.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Beagle',
                        description: 'Small, loving, and curious hound breed',
                        price: '\$500',
                        imageUrl: 'assets/Dog_Products/beagle.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Bulldog',
                        description: 'Docile and willful dog breed',
                        price: '\$1200',
                        imageUrl: 'assets/Dog_Products/bulldog.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Poodle',
                        description: 'Active, alert, and intelligent breed',
                        price: '\$900',
                        imageUrl: 'assets/Dog_Products/poodle.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Dachshund',
                        description: 'Courageous and playful breed',
                        price: '\$600',
                        imageUrl: 'assets/Dog_Products/dachshund.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Boxer',
                        description: 'Fun-loving and affectionate dog breed',
                        price: '\$850',
                        imageUrl: 'assets/Dog_Products/boxer.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Shih Tzu',
                        description: 'Loyal and affectionate toy dog breed',
                        price: '\$750',
                        imageUrl: 'assets/Dog_Products/shih_tzu.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Yorkshire Terrier',
                        description: 'Small dog with a big personality',
                        price: '\$600',
                        imageUrl: 'assets/Dog_Products/yorkshire_terrier.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Siberian Husky',
                        description: 'Friendly and gentle dog breed',
                        price: '\$1100',
                        imageUrl: 'assets/Dog_Products/siberian_husky.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Chihuahua',
                        description: 'Lively and loyal companion dog',
                        price: '\$400',
                        imageUrl: 'assets/Dog_Products/chihuahua.jpg',
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
