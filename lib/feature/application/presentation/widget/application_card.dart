import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/application_entity.dart';
import '../view_model/application_view_model.dart';

class ApplicationCard extends ConsumerStatefulWidget {
  final ApplicationEntity application;

  const ApplicationCard({
    Key? key,
    required this.application,
  }) : super(key: key);

  @override
  ConsumerState<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends ConsumerState<ApplicationCard> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Color(0xFF84D5D8);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _getGradientColors(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getTitle(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _getMessage(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 16),
              if (widget.application.isApproved == 'accepted')
                ElevatedButton(
                  onPressed: () {
                    ref.read(applicationViewModelProvider.notifier).openMeet(widget.application.petId);
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors() {
    final themeColor = Color(0xFF84D5D8);
    switch (widget.application.isApproved) {
      case 'accepted':
        return [themeColor, themeColor.withGreen(230)];
      case 'rejected':
        return [themeColor.withRed(230), themeColor.withRed(200)];
      default:
        return [themeColor.withOpacity(0.7), themeColor.withOpacity(0.5)];
    }
  }

  String _getTitle() {
    switch (widget.application.isApproved) {
      case 'accepted':
        return 'Congratulations!';
      case 'rejected':
        return 'Application Rejected';
      default:
        return 'Application Pending';
    }
  }

  String _getMessage() {
    switch (widget.application.isApproved) {
      case 'accepted':
        return widget.application.adminMessage ?? 'Your application has been approved.';
      case 'rejected':
        return 'We\'re sorry, but your application was not approved.';
      default:
        return 'Your application is still under review.';
    }
  }
}
