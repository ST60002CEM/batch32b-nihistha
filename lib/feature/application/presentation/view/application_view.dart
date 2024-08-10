import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationView extends ConsumerStatefulWidget {
  const ApplicationView({super.key});

  @override
  ConsumerState<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends ConsumerState<ApplicationView> {
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
  // Form fields controllers (unchanged)

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption Application'),
        backgroundColor: Colors.white70,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color(0xff84D5D8),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),

            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            if (_currentStep < 3) setState(() => _currentStep += 1);
          },
          onStepCancel: () {
            if (_currentStep > 0) setState(() => _currentStep -= 1);
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff84D5D8), // Use your desired color here
                    foregroundColor: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: Text('Cancel',style: TextStyle(color: Colors.black),),
                ),
              ],
            );
          },
          steps: [
            Step(
              title: Text('Personal Information'),
              content: Column(
                children: [
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => value!.isEmpty ? 'Please enter your full name' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      prefixIcon: Icon(Icons.cake),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty ? 'Please enter your age' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _occupationController,
                    decoration: InputDecoration(
                      labelText: 'Occupation',
                      prefixIcon: Icon(Icons.work),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Contact Information'),
              content: Column(
                children: [
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(Icons.home),
                    ),
                    validator: (value) => value!.isEmpty ? 'Please enter your address' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                        ? 'Please enter a valid email' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) => !RegExp(r'^\d{10}$').hasMatch(value!)
                        ? 'Please enter a valid 10-digit phone number' : null,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Living Situation'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Do you have pets at home?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Radio(
                        value: 'Yes',
                        groupValue: _haveDogs,
                        onChanged: (value) => setState(() => _haveDogs = value as String),
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'No',
                        groupValue: _haveDogs,
                        onChanged: (value) => setState(() => _haveDogs = value as String),
                      ),
                      Text('No'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('What\'s your living situation?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  DropdownButtonFormField<String>(
                    value: _livingSituation,
                    items: ['House', 'Apartment', 'Room'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _livingSituation = value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home_work),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Reason for Adoption'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Write the reason for adoption:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _reasonForAdoptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Please provide your reason for wanting to adopt...',
                    ),
                    validator: (value) => value!.isEmpty ? 'Please provide a reason for adoption' : null,
                  ),
                  SizedBox(height: 20),

                ],
              ),
            ),
          ],
        ),

      ),

    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Application Submitted Successfully')),
      );
    }
  }
}