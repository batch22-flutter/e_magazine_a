import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  final List<Map<String, String>> magazines = [
    {
      'title': 'TechTonic Monthly',
      'college': 'Greenfield Tech',
      'image': 'assets/cover1.png',
    },
    {
      'title': 'Design Digest',
      'college': 'Metro Design College',
      'image': 'assets/cover1.png',
    },
    {
      'title': 'Artistry Weekly',
      'college': 'Valley View Arts',
      'image': 'assets/cover1.png',
    },
    {
      'title': 'CodeCraft',
      'college': 'Nova University',
      'image': 'assets/cover1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Image.network(
              'assets/cover1.png',
              height: 32,
            ),
            SizedBox(width: 8),
            Text('eMagX', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Search bar
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white54),
                  hintText: 'Search magazines...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: magazines.length,
                itemBuilder: (context, index) {
                  final magazine = magazines[index];
                  return _buildMagazineTile(context, magazine);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourites',
          ),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/profile');
          if (index == 1) Navigator.pushNamed(context, '/favourites');
        },
      ),
    );
  }

  Widget _buildMagazineTile(BuildContext context, Map<String, String> magazine) {
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
          // Magazine Image
          Image.network(
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

          // Text + Buttons
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Like & Comment
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.white70),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.comment_outlined, color: Colors.white70),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    // 3-dot Menu
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert, color: Colors.white70),
                      color: Colors.grey[850],
                      onSelected: (value) {
                        if (value == 'favourite') {
                          // Add to favourites
                        } else if (value == 'report') {
                          // Report logic
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'favourite',
                          child: Text('Add to Favourites', style: TextStyle(color: Colors.white)),
                        ),
                        PopupMenuItem(
                          value: 'report',
                          child: Text('Report Magazine', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
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
