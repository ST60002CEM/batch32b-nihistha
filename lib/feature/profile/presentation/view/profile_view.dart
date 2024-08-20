import 'package:adoptapet/feature/profile/presentation/view/update_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../forgot_password/presentation/view/verification_view.dart';
import '../view_model/profile_view_model.dart';

class ProfileUI extends ConsumerStatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends ConsumerState<ProfileUI> {

  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileViewModelProvider.notifier).fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewModelProvider);

    if (profileState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (profileState.error != null) {
      return Center(child: Text('Error: ${profileState.error}'));
    }

    final profile = profileState.profile;
    if (profile == null) {
      return const Center(child: Text('No profile data'));
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: (
                ) {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.fullname,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff84D5D8),
                        ),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: Color(0xff84D5D8),
                    child: Icon(
                        Icons.edit,
                        color: Colors.white),
                    onPressed: () {
                      ref.read(profileViewModelProvider.notifier).openUpdateProfileView();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.grey),
                title: Text(profile.phonenumber),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.grey),
                title: Text(profile.email),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.grey),
                title: Text('Your Favorites'),
                onTap: (

                    ) {/* Your Favorites functionality */},
              ),
              ListTile(
                leading: Icon(Icons.description, color: Colors.grey),
                title: Text('My Applications'),
                onTap: () {
                  ref.read(profileViewModelProvider.notifier).openUserApplications();
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_reset, color: Colors.grey),
                title: Text('Forgot Password'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const VerificationView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.red),
                title: Text('Log out', style: TextStyle(color: Colors.red)),
                onTap: () {/* Log out functionality */},
              ),
            ],
          ),
        ),
      ),
    );
  }
}