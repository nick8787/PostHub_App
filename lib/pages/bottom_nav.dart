import 'package:flutter/material.dart';
import 'package:post_hub_app/pages/home/home_page.dart';
import 'package:post_hub_app/pages/profile/profile_page.dart';
import 'package:post_hub_app/pages/create/create_selection_page.dart';
import 'package:post_hub_app/pages/notifications/notifications_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  late final List<Widget> _pages;
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      CreatePage(),
      NotificationsPage(),
      const ProfilePage(),
    ];
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  void _changeIndex(int index) {
    setState(() {
      _controller.reset();
      _selectedIndex = index;
      _controller.forward();
    });
  }

  Color _iconColor(int index) {
    return _selectedIndex == index
        ? Colors.deepPurpleAccent
        : Colors.grey[500]!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: _controller.isAnimating || _fadeAnimation.value != 0
          ? FadeTransition(
        opacity: _fadeAnimation,
        child: _pages[_selectedIndex],
      )
          : _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _changeIndex,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey[500],
          selectedLabelStyle: const TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
          unselectedLabelStyle: const TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/ic_home.png",
                color: _iconColor(0),
                height: 24,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/ic_create.png",
                color: _iconColor(1),
                height: 24,
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/ic_notif.png",
                color: _iconColor(2),
                height: 24,
              ),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/ic_p.png",
                color: _iconColor(3),
                height: 24,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
