import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/application_entity.dart';

class ApplicationCard extends StatelessWidget {
  final ApplicationEntity application;

  const ApplicationCard({Key? key, required this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (application.isApproved == 'accepted') {
      return Card(
        color: Colors.green,
        child: ListTile(
          title: Text('Application Accepted'),
          subtitle: Text('Congratulations! Your application has been approved.'),
        ),
      );
    } else if (application.isApproved == 'rejected') {
      return Card(
        color: Colors.red,
        child: ListTile(
          title: Text('Application Rejected'),
          subtitle: Text('We\'re sorry, but your application was not approved.'),
        ),
      );
    } else {
      return Card(
        color: Colors.grey,
        child: ListTile(
          title: Text('Application Pending'),
          subtitle: Text('Your application is still under review.'),
        ),
      );
    }
  }
}