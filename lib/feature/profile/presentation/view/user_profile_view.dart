import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class Application {
  final String dogName;
  final String dogImageUrl;
  final String status;

  Application({required this.dogName, required this.dogImageUrl, required this.status});
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late User user;
  late List<Application> applications;

  // Define color scheme
  final Color primaryColor = Color(0xFF84D5D8);
  final Color accentColor = Color(0xFF5CB8BB);
  final Color backgroundColor = Color(0xFFE6F7F8);
  final Color textColor = Color(0xFF2C3E50);

  @override
  void initState() {
    super.initState();
    // Initialize with dummy data
    user = User(name: 'John Doe', email: 'john.doe@example.com');
    applications = [
      Application(
        dogName: 'Buddy',
        dogImageUrl: 'https://example.com/buddy.jpg',
        status: 'Pending',
      ),
      Application(
        dogName: 'Max',
        dogImageUrl: 'https://example.com/max.jpg',
        status: 'Approved',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          user.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: textColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement edit functionality
                    },
                    icon: Icon(Icons.edit, size: 18),
                    label: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'My Applications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: applications.length,
                itemBuilder: (context, index) {
                  final application = applications[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              application.dogImageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  color: accentColor.withOpacity(0.1),
                                  child: Icon(Icons.pets, color: accentColor),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  application.dogName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Status: ${application.status}',
                                  style: TextStyle(
                                    color: application.status == 'Approved'
                                        ? Colors.green
                                        : accentColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}