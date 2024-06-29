

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // providing the entity into product card
  final String name;
  final String size;
  final String image;


  ProductCard(
      {required this.name,
        required this.size,
        required this.image
      });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double imageHeight = screenSize.width > 600 ? 150.0 : 100.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(image,
                height: imageHeight, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,
                    style: TextStyle(
                        fontSize: screenSize.width > 600 ? 18 : 16,
                        fontWeight: FontWeight.bold)),
                Text(size,
                    style: TextStyle(
                        fontSize: screenSize.width > 600 ? 16 : 14,
                        color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}