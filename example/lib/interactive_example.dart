import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'modal-screen.dart';
import 'screens.dart';

class InteractiveExample extends StatefulWidget {
  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  PersistentTabController _controller;
  bool _hideNavBar = false;
  bool _hideNavigationBarWhenKeyboardShows = true;
  bool _resizeToAvoidBottomInset = true;
  bool _stateManagement = true;
  bool _handleAndroidBackButtonPress = true;
  bool _popAllScreensOnTapOfSelectedTab = true;
  bool _avoidBottomPadding = true;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> _tabs() {
    return [
      PersistentTabConfig(
        screen: MainScreen(
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        item: ItemConfig(
          icon: Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.purple,
        ),
      ),
      PersistentTabConfig(
        screen: MainScreen(
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        item: ItemConfig(
          icon: Icon(Icons.search),
          title: "Search",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
        navigatorConfig: NavigatorConfig(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),
      ),
      PersistentTabConfig.noScreen(
        item: ItemConfig(
          icon: Icon(Icons.add),
          title: "Add",
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
        ),
        navigatorConfig: NavigatorConfig(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),
        onPressed: (context) {
          pushDynamicScreen(context,
              screen: SampleModalScreen(), withNavBar: true);
        },
      ),
      PersistentTabConfig(
        screen: MainScreen(
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        item: ItemConfig(
          icon: Icon(Icons.message),
          title: "Messages",
          activeColorPrimary: Colors.deepOrange,
          inactiveColorPrimary: Colors.grey,
        ),
        navigatorConfig: NavigatorConfig(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),
      ),
      PersistentTabConfig(
        screen: MainScreen(
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        item: ItemConfig(
          icon: Icon(Icons.settings),
          title: "Settings",
          activeColorPrimary: Colors.indigo,
          inactiveColorPrimary: Colors.grey,
        ),
        navigatorConfig: NavigatorConfig(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),
      ),
    ];
  }

  void showSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _hideNavBar,
                  onChanged: (value) {
                    setState(() {
                      _hideNavBar = value;
                    });
                  },
                ),
                Text("Hide Navigation Bar"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _hideNavigationBarWhenKeyboardShows,
                  onChanged: (value) {
                    setState(() {
                      _hideNavigationBarWhenKeyboardShows = value;
                    });
                  },
                ),
                Text("Hide Navigation Bar\nWhen Keyboard Shows"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _resizeToAvoidBottomInset,
                  onChanged: (value) {
                    setState(() {
                      _resizeToAvoidBottomInset = value;
                    });
                  },
                ),
                Text("Resize to avoid bottom inset"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _stateManagement,
                  onChanged: (value) {
                    setState(() {
                      _stateManagement = value;
                    });
                  },
                ),
                Text("State Management"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _handleAndroidBackButtonPress,
                  onChanged: (value) {
                    setState(() {
                      _handleAndroidBackButtonPress = value;
                    });
                  },
                ),
                Text("Handle Android Back Button Press"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _popAllScreensOnTapOfSelectedTab,
                  onChanged: (value) {
                    setState(() {
                      _popAllScreensOnTapOfSelectedTab = value;
                    });
                  },
                ),
                Text("Pop all screens when\ntapping current tab"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _avoidBottomPadding,
                  onChanged: (value) {
                    setState(() {
                      _avoidBottomPadding = value;
                    });
                  },
                ),
                Text("Avoid bottom padding"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (essentials) => BottomNavStyle11(
        navBarEssentials: essentials,
        navBarDecoration: NavBarAppearance(
          padding: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () => showSettings(context), icon: Icon(Icons.settings)),
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(4.0),
      navBarOverlap: NavBarOverlap.full(),
      avoidBottomPadding: _avoidBottomPadding,
      handleAndroidBackButtonPress: _handleAndroidBackButtonPress,
      resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
      stateManagement: _stateManagement,
      navBarHeight: kBottomNavigationBarHeight,
      hideNavigationBarWhenKeyboardShows: _hideNavigationBarWhenKeyboardShows,
      popActionScreens: PopActionScreensType.all,
      onWillPop: (context) async {
        await showDialog(
          context: context,
          useSafeArea: true,
          builder: (context) => Container(
            height: 50.0,
            width: 50.0,
            color: Colors.white,
            child: ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
        return false;
      },
      hideNavigationBar: _hideNavBar,
      popAllScreensOnTapOfSelectedTab: _popAllScreensOnTapOfSelectedTab,
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
