import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/account/account_page.dart';
import 'package:myapp/pages/auth/sign_in_page.dart';
import 'package:myapp/pages/auth/sign_up_page.dart';
import 'package:myapp/pages/cart/cart_history.dart';
import 'package:myapp/pages/home/main_wine_page.dart';
import 'package:myapp/utilities/app_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //late PersistentTabController _controller;

  List pages = [
    MainWinePage(),
    Container(
      child: Text("History page"),
    ),
    CartHistory(),
    AccountPage()
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppConstant.APP_NAME,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              label: AppConstant.APP_NAME),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: AppConstant.APP_NAME),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: AppConstant.APP_NAME)
        ],
      ),
    );
  }

  // @override
  // void initState() {
  //   _controller = PersistentTabController(initialIndex: 0);
  // }

//   List<Widget> _buildScreens() {
//     return [
//       MainWinePage(),
//       Container(child: Center(child: Text("Next page"))),
//       Container(child: Center(child: Text("Next next page"))),
//       Container(child: Center(child: Text("Next next next page")))
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.home),
//         title: ("Home"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.archivebox_fill),
//         title: ("Archive"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.cart_fill),
//         title: ("Cart"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.person),
//         title: ("Me"),
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style12, // Choose the nav bar style with this property.
//     );
//   }
//
}
