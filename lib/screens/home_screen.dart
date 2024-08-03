import 'package:assignment/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment/screens/all_posts.dart';
import 'package:assignment/screens/create_post_screen.dart';

// import 'package:assignment/screens/profile_page.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AllPosts(),
    const CreatePostScreen(),
    Container(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return;

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xffEFF1F4),
        appBar: _selectedIndex == 1
            ? null
            : AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                elevation: 1,
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ${widget.username}!',
                        style: const TextStyle(
                          color: Color(0xff181636),
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.15,
                        ),
                      ),
                      Image.asset(
                        'assets/notification_icon.png',
                        height: 25,
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: _selectedIndex == 1
            ? null
            : ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add),
                      label: 'Create Post',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black54,
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
      ),
    );
  }
}
