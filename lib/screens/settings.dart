import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.black,
              ),
              Positioned(
                bottom: -50,
                left: 20,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Huzaifa',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Junior AI Flutter App Developer',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMenu(
                  icon: Icons.account_circle_outlined,
                  title: 'My Account',
                ),
                _buildMenu(icon: Icons.settings, title: 'Settings'),
                _buildMenu(
                  icon: Icons.help_center_outlined,
                  title: 'Help Centre',
                ),
                _buildMenu(
                  icon: Icons.notifications_outlined,
                  title: 'Push Notification',
                ),
                _buildMenu(icon: Icons.credit_card_outlined, title: 'Payment'),

                _buildMenu(icon: Icons.headset_mic_outlined, title: 'Support'),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(50),
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
            ), child: Text('Log out',style: TextStyle(
              fontSize: 16,
            ),)),
          ),)
        ],
      ),
    );
  }
}

Widget _buildMenu({
  required IconData icon,
  required String title,
  bool isLast = false,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: isLast
          ? null
          : Border(bottom: BorderSide(color: Colors.black38, width: 1)),
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.black54, size: 22),
      title: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black54,
        size: 20,
      ),
      onTap: () {},
    ),
  );
}
