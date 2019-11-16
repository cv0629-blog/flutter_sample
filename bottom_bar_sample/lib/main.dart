import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _page = 0;
  final _bottomNavigationBarItems = new List<BottomNavigationBarItem>();

  // Icon
  static const _footerIcons = [
    Icons.home,
    Icons.search,
    Icons.mail_outline,
    Icons.account_circle,
  ];

  // Icon Strings
  static const _footerItemNames = [
    'home',
    'search',
    'mail',
    'account',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    for (var i = 0; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_updateIndexState(i));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bottom Bar Sample'),
        elevation: 4.0,
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Center(child: Text('home')),
          Center(child: Text('search')),
          Center(child: Text('mail')),
          Center(child: Text('account')),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: _bottomNavigationBarItems,
      ),
    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  BottomNavigationBarItem _updateIndexState(int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          _footerIcons[index],
          color: Colors.black26,
        ),
        title: Text(
          _footerItemNames[index],
          style: TextStyle(
            color: Colors.black26,
          ),
        ));
  }
}
