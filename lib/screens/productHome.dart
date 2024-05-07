import 'package:flutter/material.dart';
import 'package:talapets/screens/homeScreen.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back75.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: 10), // Adjust margin to raise the image up
              child: Image.asset(
                product.image,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Product Description',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'It\'s price is ' + product.price + '\$',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showPopUpMessage(context);
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff95654E),
                  foregroundColor: Colors.white,
                  fixedSize: Size(200, 60)),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopUpMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Talapets"),
          content: Text("item added to cart"),
        );
      },
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}
