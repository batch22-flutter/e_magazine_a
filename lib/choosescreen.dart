import 'package:e_magazine/user/register.dart';
import 'package:flutter/material.dart';

import 'editor/register.dart';

class ChooseRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),

              // App Branding
              Text(
                'eMagX',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Choose your role to continue',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 60),

              // User Option
              _buildRoleCard(
                context,
                title: 'User',
                description: 'Explore and read premium digital magazines.',
                icon: Icons.person_outline,
                onTap: () {
                  // Navigate to User Registration
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterPage();
                  },));
                },
              ),
              SizedBox(height: 30),

              // Editor Option
              _buildRoleCard(
                context,
                title: 'Editor',
                description: 'Submit and manage magazine content.',
                icon: Icons.edit_outlined,
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterEditorPage();
                  },));
                },
              ),

              Spacer(),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(color: Colors.white70)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white10,
              radius: 28,
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 18),
          ],
        ),
      ),
    );
  }
}
