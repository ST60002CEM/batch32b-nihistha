import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';
import '../view_model/application_view_model.dart';

class UpdateApplicationView extends ConsumerStatefulWidget {
  final String petId;

  const UpdateApplicationView({Key? key, required this.petId}) : super(key: key);

  @override
  _AdoptionApplicationFormState createState() => _AdoptionApplicationFormState();
}

class _AdoptionApplicationFormState extends ConsumerState<UpdateApplicationView> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _occupationController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _reasonForAdoptionController = TextEditingController();
  bool _haveDogs = false;
  String _livingSituation = 'House';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption Application'),
        backgroundColor: Colors.white70,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              Text('Do you have pets at home?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: _haveDogs,
                    onChanged: (value) => setState(() => _haveDogs = value as bool),
                  ),
                  Text('Yes'),
                  Radio(
                    value: false,
                    groupValue: _haveDogs,
                    onChanged: (value) => setState(() => _haveDogs = value as bool),
                  ),
                  Text('No'),
                ],
              ),
              SizedBox(height: 16),
              Text('What\'s your living situation?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _livingSituation,
                items: ['House', 'Apartment', 'Room'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _livingSituation = value as String),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.home_work),
                ),
              ),
              SizedBox(height: 16),
              Text('Write the reason for adoption:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _reasonForAdoptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Please provide your reason for wanting to adopt...',
                ),
                validator: (value) => value!.isEmpty ? 'Please provide a reason for adoption' : null,
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitApplication,
                  child: Text('Submit Application'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff84D5D8),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitApplication() {
    if (_formKey.currentState!.validate()) {
      var application = ApplicationEntity(
        name: _fullnameController.text,
        email: _emailController.text,
        phonenumber: _phoneController.text,
        address: _addressController.text,
        haveDog: _haveDogs,
        reasonsForAdopting: _reasonForAdoptionController.text,
        age: int.parse(_ageController.text),
        livingSituation: _livingSituation,
        petId: widget.petId,
        occupation: _occupationController.text,
      );
      ref.read(applicationViewModelProvider.notifier).submitApplication(application);
    }
  }
}