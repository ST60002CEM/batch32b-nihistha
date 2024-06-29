import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  // int _selectedIndex = 0;
  // List<Widget> lstBottomScreen = [
  //   const Center(child: Text("Dashboard")),
  //   const Center(child: Text("Profile"))
  // ];
//   final int pet = 3;
//   final categories = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0), // Add padding to the left
            child: Image.asset('assets/images/logo.png'),
          ),
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Adopt',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'apet',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          // backgroundColor: Color(0xFFB2967D),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7, // Adjust width as needed
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xFF8B5E3C)), // Brown border
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(90, 45),
                      backgroundColor: Color(0xFF8B5E3C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Dogs',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(90, 45),
                      backgroundColor: Color(0xFF8B5E3C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Cats',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(90, 45),
                      backgroundColor: Color(0xFF8B5E3C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Others',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Featured Pets",
                style: TextStyle(

                ),),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.pets), // Example icon, replace with your content
                  title: Text('Pet Information'), // Example title, replace with your content
                  subtitle: Text('Details about the selected pet'), // Example subtitle, replace with your content
                  trailing: Icon(Icons.arrow_forward), // Example trailing icon, replace with your content
                  onTap: () {
                    // Handle tap event
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}