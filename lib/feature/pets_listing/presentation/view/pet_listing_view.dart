import 'package:adoptapet/feature/pets_listing/data/data_source/pet_listing_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../view_model/pet_listing_view_model.dart';


class PetListingView extends ConsumerStatefulWidget {
  const PetListingView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetListingViewState();
}

class _PetListingViewState extends ConsumerState<PetListingView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(petListingViewModelProvider);

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
          if (_scrollController.position.extentAfter == 0) {
            // Data fetch gara api bata
            ref.read(petListingViewModelProvider.notifier).getPetListings();
          }
        }
        return true;
      },
      child: Scaffold(
        // backgroundColor: Colors.amber[100],

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
          backgroundColor: Color(0xFFFEFAE0),
        ),
        body: RefreshIndicator(
          // Yo chai pull to refresh ko lagi ho
          color: Colors.green,
          backgroundColor: Colors.white,
          onRefresh: () async {
            ref.read(petListingViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    controller: _scrollController,
                    itemCount: state.petListings.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final petListings = state.petListings[index];
                      return ProductCard(
                          image: '${ApiEndpoints.imageBaseUrl}listings/${petListings.petImage}',
                          name: petListings.petName,
                          size: petListings.size,);
                    },
                  ),
                ),
                // Data load huda feri progress bar dekhaune natra banda garne
                if (state.isLoading)
                  const CircularProgressIndicator(color: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


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
    double imageHeight = screenSize.width > 600 ? 150.0 : 200.0;

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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(image,
                height: imageHeight, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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