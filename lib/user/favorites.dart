import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  final List<Map<String, String>> favouriteMagazines = [
    {
      'title': 'TechTonic Monthly',
      'college': 'Greenfield Tech',
      'image': 'assets/cover1.png',
    },
    {
      'title': 'Artistry Weekly',
      'college': 'Valley View Arts',
      'image': 'assets/Screenshot 2025-04-28 101853.png',
    },
    // Add more favourite magazines if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Your Favourites', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: favouriteMagazines.isEmpty
            ? Center(
                child: Text(
                  'No favourites yet!',
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: favouriteMagazines.length,
                itemBuilder: (context, index) {
                  final magazine = favouriteMagazines[index];
                  return _buildMagazineCard(magazine);
                },
              ),
      ),
    );
  }

  Widget _buildMagazineCard(Map<String, String> magazine) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // Background Image
            Image.asset(
              magazine['image']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            // Gradient Overlay
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                    Colors.black87,
                  ],
                ),
              ),
            ),
            // Title and College Name
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    magazine['title']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    magazine['college']!,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
