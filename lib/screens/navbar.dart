import 'package:flutter/material.dart';

class ScreenWithBottomBar extends StatefulWidget {
  const ScreenWithBottomBar({super.key});

  @override
  State<ScreenWithBottomBar> createState() => _ScreenWithBottomBarState();
}

class _ScreenWithBottomBarState extends State<ScreenWithBottomBar> {
  // FIXED: Renamed variable to match bottom navigation usage and removed 'final'
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensures clean background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Left-aligns title text
            children: [
              const SizedBox(height: 10),
              // Header Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Hi Huzaifa Waris',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Main Headline
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Turn your ideas into\nstunning ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'AI images',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 2x2 Grid Features Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // FIXED: Replaced Spacer with Expanded to handle layouts safely
                        Expanded(
                          child: _buildFeatureCard(
                            title: 'Fantasy',
                            description: 'Create a Fantasy Picture\nand help yourself',
                            icon: Icons.auto_awesome, // Match visual context
                            iconbgcolor: Colors.orange,
                          ),
                        ),
                        Expanded(
                          child: _buildFeatureCard(
                            title: 'Realistic',
                            description: 'Create a Realistic Picture\nand help yourself',
                            icon: Icons.camera_alt,
                            iconbgcolor: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12), // FIXED: Added spacing between rows
                    Row(
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            title: 'Stylized',
                            description: 'Create a Fantasy Picture\nand help yourself',
                            icon: Icons.palette,
                            iconbgcolor: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: _buildFeatureCard(
                            title: 'Remix my photo',
                            description: 'Create a Realistic Picture\nand help yourself',
                            icon: Icons.layers,
                            iconbgcolor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Recent Creations Section Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Recent Creations',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Recent Creations Carousel
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  height: 160, // Fixed height container for scroll
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      scrollFunc(),
                      scrollFunc(),
                      scrollFunc(),
                      scrollFunc(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

Widget scrollFunc() {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 130,
        child: Image.asset(
          'assets/images/banner.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _buildFeatureCard({
  required String title, // FIXED: Changed from dynamic to String
  required String description,
  required IconData icon,
  required Color iconbgcolor,
}) {
  return Card(
    elevation: 0, // Keeps it flat modern design flat look like the UI mockup
    color: Colors.grey[50],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: iconbgcolor,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
        ],
      ),
    ),
  );
}