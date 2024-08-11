import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../view_model/pet_details_view_model.dart';

class PetDetailsView extends ConsumerStatefulWidget {
  final String petId;
  const PetDetailsView({required this.petId, super.key});

  @override
  ConsumerState<PetDetailsView> createState() => _PetDetailsViewState();
}

class _PetDetailsViewState extends ConsumerState<PetDetailsView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(petDetailsViewModelProvider.notifier)
          .getPetDetails(widget.petId);
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(petDetailsViewModelProvider);
    final details = state.listing;

    if (state.error != null) {
      return Center(child: Text('Error: ${state.error}'));
    }

    if (details == null) {
      return const Center(child: Text('No pet details'));
    }
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                '${ApiEndpoints.imageBaseUrl}${details.petImage}',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, I am ${details.petName}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    details.aboutPet,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Breed: ${details.breed}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gender: ${details.gender}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Size: ${details.size}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        // Handle apply now button press
                      },
                      child: Text(
                        'Apply Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

