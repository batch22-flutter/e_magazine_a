import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String fullName;
  final String collegeName;
  final String registerNumber;
  final String email;

  EditProfilePage({
    required this.fullName,
    required this.collegeName,
    required this.registerNumber,
    required this.email,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _collegeNameController = TextEditingController();
  final TextEditingController _registerNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.fullName;
    _collegeNameController.text = widget.collegeName;
    _registerNumberController.text = widget.registerNumber;
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Handle save action (update profile)
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Profile updated successfully!'),
              ));
              Navigator.pop(context); // Go back to the profile page
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/logo.png'),
                  backgroundColor: Colors.grey[900],
                ),
              ),
              SizedBox(height: 30),
              _buildTextField(_fullNameController, 'Full Name'),
              _buildTextField(_collegeNameController, 'College Name'),
              _buildTextField(_registerNumberController, 'Register No.'),
              _buildTextField(_emailController, 'Email'),
              SizedBox(height: 40),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.w400),
          hintStyle: TextStyle(color: Colors.white38),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Save the changes (perform any saving logic here)
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Changes saved successfully!'),
            duration: Duration(seconds: 2),
          ));
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.amberAccent, padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Save Changes',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
