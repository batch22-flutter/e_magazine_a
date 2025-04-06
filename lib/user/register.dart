import 'package:flutter/material.dart';

import '../login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCollege;

  final List<String> collegeList = [
    'Select College',
    'Greenfield Institute of Tech',
    'Valley View Arts College',
    'Metro Design Academy',
    'Nova Science University',
  ];

  @override
  void initState() {
    super.initState();
    selectedCollege = collegeList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                // Title
                Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Join eMagX and start exploring!',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 40),

                // Name
                _buildTextField(
                  icon: Icons.person_outline,
                  hintText: 'Full Name',
                ),
                SizedBox(height: 20),

                // Email
                _buildTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Email Address',
                ),
                SizedBox(height: 20),

                // Register Number
                _buildTextField(
                  icon: Icons.confirmation_number_outlined,
                  hintText: 'Register Number',
                ),
                SizedBox(height: 20),

                // College Dropdown
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.grey[900],
                    value: selectedCollege,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.school_outlined, color: Colors.white60),
                    ),
                    items: collegeList.map((college) {
                      return DropdownMenuItem(
                        value: college,
                        child: Text(college),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCollege = value!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Password
                _buildTextField(
                  icon: Icons.lock_outline,
                  hintText: 'Password',
                  obscure: true,
                ),
                SizedBox(height: 20),

                // Confirm Password
                _buildTextField(
                  icon: Icons.lock_outline,
                  hintText: 'Confirm Password',
                  obscure: true,
                ),
                SizedBox(height: 40),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                      }
                    },
                    icon: Icon(Icons.app_registration),
                    label: Text('Register', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 30),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        },));
                      },
                      child: Text('Login', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    bool obscure = false,
  }) {
    return TextFormField(
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        prefixIcon: Icon(icon, color: Colors.white60),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
