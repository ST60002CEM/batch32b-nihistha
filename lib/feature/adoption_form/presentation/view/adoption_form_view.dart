import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../pet_details/presentation/view_model/pet_details_view_model.dart';

class AdoptionFormView extends ConsumerStatefulWidget {
  const AdoptionFormView({super.key});

  @override
  ConsumerState<AdoptionFormView> createState() => _AdoptionFormViewState();
}

class _AdoptionFormViewState extends ConsumerState<AdoptionFormView> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final _fullnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _occupationController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _haveDogController = TextEditingController();
  final _reasonForAdoptionController = TextEditingController();
  String _haveDogs = 'No'; // Default value
  String? _livingSituation = 'House';

  @override
  void dispose() {
    _fullnameController.dispose();
    _ageController.dispose();
    _occupationController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _haveDogController.dispose();
    _reasonForAdoptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  labelText: 'Fullname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your fullname';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _occupationController,
                decoration: InputDecoration(
                  labelText: 'Occupation',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Do you have pets at home?', style: TextStyle(fontSize: 18)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Yes'),
                      value: 'Yes',
                      groupValue: _haveDogs,
                      onChanged: (value) {
                        setState(() {
                          _haveDogs = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('No'),
                      value: 'No',
                      groupValue: _haveDogs,
                      onChanged: (value) {
                        setState(() {
                          _haveDogs = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('What\'s your living situation?', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _livingSituation,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'House',
                    child: Text('House'),
                  ),
                  DropdownMenuItem(
                    value: 'Apartment',
                    child: Text('Apartment'),
                  ),
                  DropdownMenuItem(
                    value: 'Room',
                    child: Text('Room'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _livingSituation = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text('Write the reason for adoption:', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              TextFormField(
                controller: _reasonForAdoptionController,
                maxLines: 5, // Adjust the number of lines for the text area
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a reason for adoption';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: RoundedIconTextButton(
                  buttonText: 'Adopt',
                  backgroundColor: Color(0xff84D5D8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
