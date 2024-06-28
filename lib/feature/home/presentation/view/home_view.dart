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
//   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 10,
                    ),
                    child: Row(
                      children: [
                      Container(
                      height: 80,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.amber,
                            blurRadius: 12,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Dog",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 80,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.amber,
                            blurRadius: 12,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Dog",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 80,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.amber,
                                blurRadius: 12,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "Dog",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                      ],
                  ),
                ),
              )
              ),
  ]

          ),
        ),
      ),
    );
  }

}