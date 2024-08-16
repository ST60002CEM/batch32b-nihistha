import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/application_view_model.dart';
import '../widget/application_card.dart'; // Make sure to create this file

class MailView extends ConsumerStatefulWidget {
  const MailView({super.key});

  @override
  ConsumerState<MailView> createState() => _MailViewState();
}

class _MailViewState extends ConsumerState<MailView> {
  @override
  void initState() {
    super.initState();
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
      body: applicationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : applicationState.error != null
          ? Center(child: Text('Error: ${applicationState.error}'))
          : applicationState.userapplication.isEmpty
          ? const Center(child: Text('No applications found.'))
          : ListView.builder(
        itemCount: applicationState.userapplication.length,
        itemBuilder: (context, index) {
          final application = applicationState.userapplication[index];
          return ApplicationCard(application: application);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(applicationViewModelProvider.notifier).getUserApplication();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}