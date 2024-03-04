import 'package:flutter/material.dart';
import 'package:pill_detection/core/widgets/custom_pick_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 16),
          //! Profile Picture
          PickImageWidget(),
          const SizedBox(height: 16),

          //! Name
          const ListTile(
            title: Text("Name"),
            leading: Icon(Icons.person),
          ),
          const SizedBox(height: 16),

          //! Email
          const ListTile(
            title: Text("Email"),
            leading: Icon(Icons.email),
          ),
          const SizedBox(height: 16),

          //! Phone number
          const ListTile(
            title: Text("phone number"),
            leading: Icon(Icons.phone),
          ),
          const SizedBox(height: 16),

          //! Address
          const ListTile(
            title: Text("Address"),
            leading: Icon(Icons.location_city),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}