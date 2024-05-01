import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart';

class SellTurtlesScreen extends StatelessWidget {
  const SellTurtlesScreen({super.key});

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
            'Sell Turtles',
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
                        title: 'Red-eared Slider',
                        description:
                            'Popular and easy-to-care-for aquatic turtle',
                        price: '\$50',
                        imageUrl: 'assets/Turtle_Product/red_ear_slider.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Eastern Box Turtle',
                        description:
                            'Land-dwelling turtle found in the Eastern US',
                        price: '\$80',
                        imageUrl:
                            'assets/Turtle_Product/eastern_box_turtle.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Painted Turtle',
                        description: 'Colorful and hardy turtle species',
                        price: '\$60',
                        imageUrl: 'assets/Turtle_Product/painted_turtle.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'African Sideneck Turtle',
                        description:
                            'Distinctive side-necked turtle from Africa',
                        price: '\$90',
                        imageUrl:
                            'assets/Turtle_Product/african_sideneck_turtle.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ProductItem(
                        title: 'Western Painted Turtle',
                        description: 'Colorful turtle native to the Western US',
                        price: '\$70',
                        imageUrl:
                            'assets/Turtle_Product/western_painted_turtle.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductItem(
                        title: 'Russian Tortoise',
                        description: 'Small and hardy tortoise species',
                        price: '\$100',
                        imageUrl: 'assets/Turtle_Product/russian_tortoise.jpg',
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
