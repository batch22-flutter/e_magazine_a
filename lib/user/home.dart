import 'package:e_magazine/user/favorites.dart';
import 'package:e_magazine/user/profile.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<bool> isLikedList = []; // Track likes for each magazine

  final List<Map<String, String>> magazines = [
    {
      'title': 'TechTonic Monthly',
      'college': 'Greenfield Tech',
      'image': 'assets/cover1.png',
    },
    {
      'title': 'Design Digest',
      'college': 'Metro Design College',
      'image': 'assets/Screenshot 2025-04-28 101749.png',
    },
    {
      'title': 'Artistry Weekly',
      'college': 'Valley View Arts',
      'image': 'assets/Screenshot 2025-04-28 101853.png',
    },
    {
      'title': 'CodeCraft',
      'college': 'Nova University',
      'image': 'assets/Screenshot 2025-04-28 101920.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    isLikedList = List.generate(magazines.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProfilePage(
                  fullName: 'John Doe',
                  collegeName: 'ABC College of Engineering',
                  registerNumber: '123456',
                  email: 'johndoe@hotmail.com',
                ),
              ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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
                  return _buildMagazineTile(context, magazine, index);
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourites',
          ),
        ],
        onTap: (index) {
          if (index == 0)
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserHomePage()));
          if (index == 1)
            Navigator.push(context, MaterialPageRoute(builder: (_) => FavouritesPage()));
        },
      ),
    );
  }

  Widget _buildMagazineTile(BuildContext context, Map<String, String> magazine, int index) {
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
            Image.asset(
              magazine['image']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
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
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isLikedList[index] ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              setState(() {
                                isLikedList[index] = !isLikedList[index];
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.comment_outlined, color: Colors.white70),
                            onPressed: () {
                              _showCommentsBottomSheet(context);
                            },
                          ),
                        ],
                      ),
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

  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 10, // Example comment count
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white24,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          title: Text('User ${index + 1}', style: TextStyle(color: Colors.white)),
                          subtitle: Text('Awesome magazine!', style: TextStyle(color: Colors.white70)),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Add a comment...',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          // Send comment logic
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
