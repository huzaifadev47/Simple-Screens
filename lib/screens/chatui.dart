import 'package:flutter/material.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  int _selectedIndex = 1; // Default to 'Chats' tab

  // Dummy data for chat list to mimic the screenshot
  final List<Map<String, dynamic>> chatData = [
    {
      'name': 'Oliver',
      'message': "I'll actually cry. No shame.\nTears of joy 😭",
      'time': '12:11 PM',
      'unread': 2,
      'isOnline': true,
      'isHighlighted': true,
    },
    {
      'name': 'Rebecca (Covent Garden)',
      'message': "Yeah, we'll be ripping past Buck\nPalace 👑",
      'time': '9:12 PM',
      'isPinned': true,
      'isOnline': false,
      'isHighlighted': true,
    },
    {
      'name': 'Two Wheels London',
      'message': "Gary: We were getting ready\nyesterday and rode for abo...",
      'time': '11:11 AM',
      'unread': 32,
      'isOnline': false,
      'isMuted': true,
    },
    {
      'name': 'Inga',
      'message': "I'm not sure about Saturday yet,\ndepends if my sister still need...",
      'time': '6:19 AM',
      'isOnline': false,
    },
    {
      'name': 'Harry',
      'message': "Morning! Hope you slept\nalright. I'm off to Manchester...",
      'time': 'yest',
      'isOnline': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF121212); // Deep dark background
    const Color highlightColor = Color(0xFF232325); // Highlighted chat background
    const Color accentColor = Color(0xFF00D2A0); // Teal accent

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.add, color: Colors.black, size: 24),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Stories Row
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildYourStory();
                }
                return _buildStoryItem(index, accentColor);
              },
            ),
          ),

          // 2. Filter Chips Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _buildFilterChip('All', isSelected: true),
                _buildFilterChip('Friends', count: 2, accentColor: accentColor),
                _buildFilterChip('Work', count: 3, accentColor: accentColor),
                _buildFilterChip('Groups', count: 12, accentColor: accentColor),
              ],
            ),
          ),

          // 3. Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return _buildChatTile(chat, highlightColor, accentColor);
              },
            ),
          ),
        ],
      ),
      
      // 4. Bottom Navigation Bar
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: bgColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: const Text('4'),
                backgroundColor: accentColor,
                textColor: Colors.black,
                child: const Icon(Icons.chat_bubble),
              ),
              label: 'Chats',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.call_outlined),
              label: 'Calls',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widget Methods ---

  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D2A0),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF121212), width: 3),
                  ),
                  child: const Icon(Icons.add, size: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Your story', style: TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildStoryItem(int index, Color accentColor) {
    List<String> names = ["", "Inga", "Oliver", "Olga Kru...", "Diana Mo...", "Harry"];
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2.5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF00D2A0), Color(0xFF9D00FF)], // Teal to Purple gradient
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2), // Black gap between border and image
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF121212), 
              ),
              child: const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(names[index], style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false, int? count, Color? accentColor}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[400],
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildChatTile(Map<String, dynamic> chat, Color highlightColor, Color accentColor) {
    bool isHighlighted = chat['isHighlighted'] ?? false;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isHighlighted ? highlightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Stack(
          children: [
            const CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            if (chat['isOnline'] == true)
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: isHighlighted ? highlightColor : const Color(0xFF121212), width: 3),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                chat['name'],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (chat['isMuted'] == true) ...[
              const SizedBox(width: 4),
              Icon(Icons.volume_off, color: Colors.grey[600], size: 16),
            ]
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            chat['message'],
            style: TextStyle(color: Colors.grey[400], height: 1.3),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              chat['time'],
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
            const SizedBox(height: 8),
            if (chat['unread'] != null)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  chat['unread'].toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              )
            else if (chat['isPinned'] == true)
              Icon(Icons.push_pin, color: Colors.grey[500], size: 18)
            else
              const SizedBox(height: 18), // Empty space to keep alignment
          ],
        ),
      ),
    );
  }
}