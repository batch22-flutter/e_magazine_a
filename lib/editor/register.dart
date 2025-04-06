import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class RegisterEditorPage extends StatefulWidget {
  @override
  _RegisterEditorPageState createState() => _RegisterEditorPageState();
}

class _RegisterEditorPageState extends State<RegisterEditorPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedFileName;

  void _pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFileName = result.files.first.name;
      });
    }
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

                Center(
                  child: Text(
                    'Editor Registration',
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
                    'Apply as a student editor',
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

                // College Name
                _buildTextField(
                  icon: Icons.school_outlined,
                  hintText: 'College Name',
                ),
                SizedBox(height: 20),

                // Email
                _buildTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Email Address',
                ),
                SizedBox(height: 20),

                // Phone Number
                _buildTextField(
                  icon: Icons.phone_outlined,
                  hintText: 'Phone Number',
                  inputType: TextInputType.phone,
                ),
                SizedBox(height: 20),

                // Register Number
                _buildTextField(
                  icon: Icons.confirmation_number_outlined,
                  hintText: 'Register Number',
                ),
                SizedBox(height: 30),

                // Upload Document Section
                Text(
                  'Upload Proof of Editor Role',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickDocument,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.upload_file, color: Colors.white60),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            selectedFileName ?? 'Tap to upload document (PDF, DOCX, JPG)',
                            style: TextStyle(
                              color: selectedFileName == null ? Colors.white54 : Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        // Submit form
                      }
                    },
                    icon: Icon(Icons.app_registration),
                    label: Text('Register as Editor', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 30),

                // Back to Choose
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '← Go back',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
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
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      keyboardType: inputType,
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
