import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

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
    Icons.add_a_photo,
    Icons.mail_outline,
    Icons.account_circle,
  ];

  // Icon Strings
  static const _footerItemNames = [
    'home',
    'search',
    'camera',
    'mail',
    'account',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    for (var i = 0; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_updateDeactiveState(i));
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
        title: new Text('Application Name'),
        elevation: 4.0,
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Center(child: Text('home')),
          Center(child: Text('search')),
          Center(child: Text('camera')),
          Center(child: Text('mail')),
          Center(child: Text('account')),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // これを書かないと3つまでしか表示されない
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

  // インデックスのアイテムをディアクティベートする
  BottomNavigationBarItem _updateDeactiveState(int index) {
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
