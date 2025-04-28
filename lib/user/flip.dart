import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  Uint8List? pdfBytes;
  bool isLoading = true;
  bool hasError = false;

  final String pdfUrl = 'https://res.cloudinary.com/diskdblly/image/upload/v1740310779/contractor_docs/company_reg/qlwxcqd0fsu4yb2rwdl1.png';

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      final response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode == 200) {
        setState(() {
          pdfBytes = response.bodyBytes;
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
        });
      }
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(Icons.picture_as_pdf, color: Colors.white),
            SizedBox(width: 10),
            Text("eMagX PDF Viewer", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : hasError
              ? Center(
                  child: Text("Failed to load PDF", style: TextStyle(color: Colors.white)),
                )
              : SfPdfViewer.memory(pdfBytes!),
    );
  }
}
