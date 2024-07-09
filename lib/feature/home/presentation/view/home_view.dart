import 'package:adoptapet/core/common/widgets/petcard.dart';
import 'package:adoptapet/feature/pets_listing/presentation/view/pet_listing_view.dart';
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetListingView(), // Replace with your page
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(90, 45),
                      backgroundColor: Color(0xFF8B5E3C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'All Pets',
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
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://miro.medium.com/v2/resize:fit:794/0*a9fixIuxz1V28Ih5.jpg'),
                    radius: 30,
                  ), // Example icon, replace with your content
                  title: Text('Our Organization'), // Example title, replace with your content
                  subtitle: Text('Learn more about our organization'), // Example subtitle, replace with your content
                  trailing: Icon(Icons.arrow_forward), // Example trailing icon, replace with your content
                  onTap: () {
                    // Handle tap event
                  },
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLVyH-HnMy5kWybuQLBaeuEFTrC8PqQQ1KFQ&s',
                  height: 150,
                  width: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Image not found'));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Maya"),
              ),
            ],
          ),
        ),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2023/07/top-20-small-dog-breeds.jpeg.jpg',
                  height: 150,
                  width: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Image not found'));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Bella"),
              ),
            ],
          ),
        ),],),
            ],
          ),
        ),
      ),
    );
  }

}