import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../application/presentation/view_model/application_view_model.dart';
import '../view_model/pet_details_view_model.dart';

class PetDetailsView extends ConsumerStatefulWidget {
  final String petId;
  const PetDetailsView({required this.petId, super.key});

  @override
  ConsumerState<PetDetailsView> createState() => _PetDetailsViewState();
}

class _PetDetailsViewState extends ConsumerState<PetDetailsView> {
  static const Color themeColor = Color(0xFF84D5D8);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(petDetailsViewModelProvider.notifier).getPetDetails(widget.petId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(petDetailsViewModelProvider);
    final details = state.listing;

    if (state.error != null) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Center(child: Text('Error: ${state.error}', style: TextStyle(color: Colors.red))),
      );
    }

    if (details == null) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Center(child: CircularProgressIndicator(color: themeColor)),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageHeader(details.petImage),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPetName(details.petName),
                  SizedBox(height: 16),
                  _buildAboutPet(details.aboutPet),
                  SizedBox(height: 24),
                  _buildPetDetails(details),
                  SizedBox(height: 32),
                  _buildApplyButton(details.petid!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Image.asset('assets/images/logo.png'),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Adopt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: 'apet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildImageHeader(String petImage) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Image.network(
        '${ApiEndpoints.imageBaseUrl}listings/$petImage',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
              color: themeColor,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(child: Icon(Icons.error, color: Colors.red, size: 50));
        },
      ),
    );
  }

  Widget _buildPetName(String name) {
    return Text(
      'Hi, I am $name',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildAboutPet(String about) {
    return Text(
      about,
      style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
    );
  }

  Widget _buildPetDetails(dynamic details) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildDetailItem(Icons.pets, 'Breed', details.breed),
          Divider(color: themeColor.withOpacity(0.3)),
          _buildDetailItem(Icons.wc, 'Gender', details.gender),
          Divider(color: themeColor.withOpacity(0.3)),
          _buildDetailItem(Icons.height, 'Size', details.size),
          Divider(color: themeColor.withOpacity(0.3)),
          _buildDetailItem(Icons.medical_services, 'Vaccination', 'Vaccinated'),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: themeColor, size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: themeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton(String petId) {
    return Center(
      child: ElevatedButton.icon(
        icon: Icon(Icons.pets, color: Colors.white),
        label: Text(
          'Apply to Adopt',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          ref.read(petDetailsViewModelProvider.notifier).openApplicationView(petId);
        },
      ),
    );
  }
}