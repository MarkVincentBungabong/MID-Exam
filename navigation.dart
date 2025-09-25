import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/cbae_page.dart';
import 'package:demo/pages/ccs_page.dart';
import 'package:demo/pages/coa_page.dart';
import 'package:demo/pages/educ_page.dart';
import 'package:flutter/material.dart';


class MainNavigationPage extends StatefulWidget{
  @override
  _MainNavigationPageState createState()=>  _MainNavigationPageState();

}

class _MainNavigationPageState extends State{
  int _selectedIndex = 2;
  PageController _pageController = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(

        children: [
          HomePage(),
          CcsPage(),
          EducPage(),
          CoaPage(),
          CbaePage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.css),label: 'CCS'),
          BottomNavigationBarItem(icon: Icon(Icons.cast_for_education),label: 'EDUC'),
          BottomNavigationBarItem(icon: Icon(Icons.commit_rounded),label: 'COA'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble),label: 'CBAE'),

        ],
      ),
    );
  }
  void _onTabTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
}