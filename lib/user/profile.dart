import 'package:e_magazine/user/editProfile.dart';
import 'package:e_magazine/user/favorites.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String fullName;
  final String collegeName;
  final String registerNumber;
  final String email;

  ProfilePage({
    required this.fullName,
    required this.collegeName,
    required this.registerNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.png'), // Your logo or profile pic
                backgroundColor: Colors.grey[900],
              ),
            ),
            SizedBox(height: 25),

            Text(
              fullName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(height: 50),

            _buildInfoRow('College', collegeName),
            SizedBox(height: 30),
            _buildInfoRow('Register No.', registerNumber),

            SizedBox(height: 55),
            Divider(color: Colors.white24, thickness: 1.0),

           _buildOption(context: context, icon: Icons.favorite, title: 'Favourites'),
_buildOption(context: context, icon: Icons.edit, title: 'Edit Profile'),
_buildOption(context: context, icon: Icons.logout, title: 'Logout'),

SizedBox(height: 30),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 32),
  child: SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        Navigator.pop(context); // Go back to previous page
      },
      child: Text(
        'Back',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),

            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

   Widget _buildOption({required BuildContext context, required IconData icon, required String title}) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
    onTap: () {
      if (title == 'Favourites') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavouritesPage()),
        );
      }
      if (title == 'Edit Profile') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage(fullName: fullName,
              collegeName: collegeName,
              registerNumber: registerNumber,
              email: email,)),
        );
      }
      // You can add other conditions here if needed
    },
  );
}
}