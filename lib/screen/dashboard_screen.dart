import 'package:adoptapet/app/app.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      appBar: AppBar(
        leading: Image.asset('assets/images/logo.png'),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Adopt',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'apet',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                      "assets/images/dashboard_image.png",
                  ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Spacer(),
                SizedBox(height: 16), // Adds some padding from the top
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
