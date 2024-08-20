

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/constants/api_endpoints.dart';
import '../../../application/presentation/view_model/application_view_model.dart';
import '../../domain/entity/user_application_entity.dart';
import '../state/user_application_state.dart';
import '../view_model/user_application_view_model.dart';

class UserApplicationDetailView extends ConsumerStatefulWidget {
  const UserApplicationDetailView({Key? key}) : super(key: key);


  @override
  ConsumerState<UserApplicationDetailView> createState() => _UserApplicationsViewState();
}

class _UserApplicationsViewState extends ConsumerState<UserApplicationDetailView> {
  @override
  void initState() {
    super.initState();
    // You can perform any initialization here, e.g., fetching applications
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userApplicationViewModelProvider.notifier).getUserApplications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final applicationState = ref.watch(userApplicationViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applications'),
      ),
      body: _buildBody(context, applicationState),
    );
  }

  Widget _buildBody(BuildContext context, UserApplicationState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.error != null) {
      return Center(child: Text('Error: ${state.error}'));
    } else {
      return ListView.builder(
        itemCount: state.userApplication.length,
        itemBuilder: (context, index) {
          return ApplicationCard(
            application: state.userApplication[index],
            onEdit: () => _editApplication(context, state.userApplication[index]),
            onCancel: () => _cancelApplication(context, state.userApplication[index]),
          );
        },
      );
    }
  }

  void _editApplication(BuildContext context, UserApplicationEntity application) {
    ref.read(userApplicationViewModelProvider.notifier).openUpdateApplication(application.appid!);
  }

  void _cancelApplication(BuildContext context, UserApplicationEntity application) {
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
  final UserApplicationEntity application;
  final VoidCallback onEdit;
  final VoidCallback onCancel;

  const ApplicationCard({
    Key? key,
    required this.application,
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
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('${ApiEndpoints.imageBaseUrl}listings/${application.petDetails?.petImage}'?? 'https://via.placeholder.com/100'),
            ),
            const SizedBox(height: 8),
            Text(
              application.petDetails?.petName ?? 'Unknown Pet',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onEdit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xff84D5D8),
                  ),
                  child: const Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff84D5D8),
                  ),
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