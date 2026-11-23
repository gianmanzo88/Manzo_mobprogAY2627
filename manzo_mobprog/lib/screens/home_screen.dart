import 'package:flutter/material.dart';
import '../constants.dart';
import 'newsfeed_screen.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
 
  final PageController pageController = PageController();
 
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'facebook',
          style: TextStyle(
            fontSize: 25,
            color: FB_PRIMARY,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
 
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          NewsFeedScreen(),
 
          Center(
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: FB_PRIMARY,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
 
          pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
 
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}