import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/theme/color.dart';
import '../../../../core/common/widgets/notification_box.dart';
import '../../../../core/common/widgets/pet_item.dart';
import '../../../pets_listing/presentation/view/pet_listing_view.dart';
import 'data.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 25,
          ),
          _buildCategories(),
          // const SizedBox(
          //   height: 15,
          // ),
          // _buildDonationCard(),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text(
              "Adopt Me",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          _buildPets(),
        ]),
      ),
    );
  }

  Widget _buildAppBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    color: AppColor.labelColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                      color: AppColor.labelColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Phnom Penh, Cambodia",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        NotificationBox(
          notifiedNumber: 1,
          onTap: null,
        )
      ],
    );
  }

  _buildCategories(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(90, 90), // Increased size to accommodate icon and text
            backgroundColor: Color(0xff84D5D8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/cat.svg', // Replace with the path to your cat icon SVG
                height: 30,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                'Cats',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(90, 90), // Increased size to accommodate icon and text
            backgroundColor: Color(0xff84D5D8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/dog.svg', // Replace with the path to your dog icon SVG
                height: 30,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                'Dogs',
                style: TextStyle(color: Colors.white),
              ),
            ],
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
      fixedSize: Size(90, 90), // Increased size to accommodate icon and text
      backgroundColor: Color(0xff84D5D8),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      SvgPicture.asset(
      'assets/icons/pet-border.svg', // Replace with the path to your paw icon SVG
      height: 30,
      color: Colors.white,
      ),
      SizedBox(height: 5),
      Text(
      'All Pets',
      style: TextStyle(color: Colors.white),
      ),
      ],
      ),
    ),
    ],
    );
  }

  _buildDonationCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Donate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Donate and help us',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  _buildPets() {
    double width = MediaQuery.of(context).size.width * .8;
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        pets.length,
            (index) => PetItem(
          data: pets[index],
          width: width,
          onTap: null,
          onFavoriteTap: () {
            setState(() {
              pets[index]["is_favorited"] = !pets[index]["is_favorited"];
            });
          },
        ),
      ),
    );
  }
}
