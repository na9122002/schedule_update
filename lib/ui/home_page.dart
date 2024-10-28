import 'package:flutter/material.dart';
import 'package:wrok_app_1/ui/assiginment_screen.dart';
import 'package:wrok_app_1/ui/schedule_screen.dart';
import 'package:wrok_app_1/ui/signup_screen.dart';
import 'package:wrok_app_1/ui/today.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Thêm biến để theo dõi mục hiện tại

  // Danh sách các widget tương ứng với các mục
  final List<Widget> _pages = [
    TodayScreen(),
    ScheduleScreen(),
    AssiginmentScreen(),
    SignupScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật chỉ số mục được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Hiển thị trang tương ứng
      bottomNavigationBar: Container(
        height: 92,
        child: BottomNavigationBar(
          backgroundColor: Colors.amber,
          unselectedItemColor: Color(0xFF21283F),
          selectedItemColor: Color(0xFF80B3FF), // Màu cho mục được chọn
          currentIndex: _selectedIndex, // Chỉ số mục hiện tại
          onTap: _onItemTapped, // Hàm gọi khi người dùng chọn một mục
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.next_week),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: 'Assignments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
