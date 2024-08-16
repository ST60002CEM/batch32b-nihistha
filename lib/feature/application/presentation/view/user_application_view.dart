import 'package:adoptapet/feature/pet_details/domain/entity/pet_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adoptapet/feature/application/domain/entity/application_entity.dart';

import '../state/application_state.dart';
import '../view_model/application_view_model.dart';

class UserApplicationsView extends ConsumerStatefulWidget {
  const UserApplicationsView({Key? key}) : super(key: key);


  @override
  ConsumerState<UserApplicationsView> createState() => _UserApplicationsViewState();
}

class _UserApplicationsViewState extends ConsumerState<UserApplicationsView> {
  @override
  void initState() {
    super.initState();
    // You can perform any initialization here, e.g., fetching applications
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(applicationViewModelProvider.notifier).getUserApplication();
    });
  }

  @override
  Widget build(BuildContext context) {
    final applicationState = ref.watch(applicationViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applications'),
      ),
      body: _buildBody(context, applicationState),
    );
  }

  Widget _buildBody(BuildContext context, ApplicationState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.error != null) {
      return Center(child: Text('Error: ${state.error}'));
    } else {
      return ListView.builder(
        itemCount: state.userapplication.length,
        itemBuilder: (context, index) {
          return ApplicationCard(
            application: state.userapplication[index],
            onEdit: () => _editApplication(context, state.userapplication[index]),
            onCancel: () => _cancelApplication(context, state.userapplication[index]),
          );
        },
      );
    }
  }

  void _editApplication(BuildContext context, ApplicationEntity application) {
    ref.read(applicationViewModelProvider.notifier).openUpdateApplication(application.appid!);
  }

  void _cancelApplication(BuildContext context, ApplicationEntity application) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Application'),
          content: const Text('Are you sure you want to cancel this application?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(applicationViewModelProvider.notifier).deleteApplication(application.appid!);
              },
            ),
          ],
        );
      },
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final ApplicationEntity application;
  final PetDetailsEntity? petDetails;
  final VoidCallback onEdit;
  final VoidCallback onCancel;

  const ApplicationCard({
    Key? key,
    required this.application,
    this.petDetails,
    required this.onEdit,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Pet Name: ${petDetails!.petName}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Name: ${application.name}'),
            Text('Email: ${application.email}'),
            Text('Phone: ${application.phonenumber}'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onEdit,
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}