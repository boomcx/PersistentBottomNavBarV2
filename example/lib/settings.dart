import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

typedef NavBarBuilder = Widget Function(NavBarConfig, NavBarDecoration,
    ItemAnimationProperties, NeumorphicProperties);

class Settings {
  bool hideNavBar = false;
  bool resizeToAvoidBottomInset = true;
  bool stateManagement = true;
  bool handleAndroidBackButtonPress = true;
  bool popAllScreensOnTapOfSelectedTab = true;
  bool avoidBottomPadding = true;
  Color navBarColor = Colors.white;
  NavBarBuilder get navBarBuilder => navBarStyles[navBarStyle];
  String navBarStyle = "Style 1";
  EdgeInsets margin = EdgeInsets.all(0.0);

  Map<String, NavBarBuilder> navBarStyles = {
    "Neumorphic": (p0, p1, p2, p3) => NeumorphicBottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, neumorphicProperties: p3),
    "Style 1": (p0, p1, p2, p3) =>
        Style1BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
    "Style 2": (p0, p1, p2, p3) => Style2BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 3": (p0, p1, p2, p3) =>
        Style3BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
    "Style 4": (p0, p1, p2, p3) => Style4BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 5": (p0, p1, p2, p3) =>
        Style5BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
    "Style 6": (p0, p1, p2, p3) => Style6BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 7": (p0, p1, p2, p3) => Style7BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 8": (p0, p1, p2, p3) => Style8BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 9": (p0, p1, p2, p3) => Style9BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 10": (p0, p1, p2, p3) => Style10BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 11": (p0, p1, p2, p3) => Style11BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 12": (p0, p1, p2, p3) => Style12BottomNavBar(
        navBarConfig: p0, navBarDecoration: p1, itemAnimationProperties: p2),
    "Style 13": (p0, p1, p2, p3) =>
        Style13BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
    "Style 14": (p0, p1, p2, p3) =>
        Style14BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
    "Style 15": (p0, p1, p2, p3) =>
        Style15BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
    "Style 16": (p0, p1, p2, p3) =>
        Style16BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
  };
}

class SettingsView extends StatefulWidget {
  final Settings settings;
  final void Function(Settings) onChanged;

  const SettingsView({
    Key key,
    this.settings,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<Color>(
                value: widget.settings.navBarColor,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (Color value) {
                  setState(() {
                    widget.settings.navBarColor = value;
                  });
                  widget.onChanged(widget.settings);
                },
                items: colors.map<DropdownMenuItem<Color>>((Color value) {
                  return DropdownMenuItem<Color>(
                    value: value,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: value,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  );
                }).toList(),
              ),
              Text("NavBar Color"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: widget.settings.navBarStyle,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (String value) {
                  setState(() {
                    widget.settings.navBarStyle = value;
                  });
                  widget.onChanged(widget.settings);
                },
                items: widget.settings.navBarStyles.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text("NavBar Style"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Margin LTRB:"),
              SizedBox(width: 4),
              SizedBox(
                width: 26,
                child: TextFormField(
                  initialValue: widget.settings.margin.left.toInt().toString(),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    setState(() {
                      widget.settings.margin = widget.settings.margin
                          .copyWith(left: double.tryParse(value) ?? 0);
                    });
                    widget.onChanged(widget.settings);
                  },
                ),
              ),
              SizedBox(width: 4),
              SizedBox(
                width: 26,
                child: TextFormField(
                  initialValue: widget.settings.margin.top.toInt().toString(),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    setState(() {
                      widget.settings.margin = widget.settings.margin
                          .copyWith(top: double.tryParse(value) ?? 0);
                    });
                    widget.onChanged(widget.settings);
                  },
                ),
              ),
              SizedBox(width: 4),
              SizedBox(
                width: 26,
                child: TextFormField(
                  initialValue: widget.settings.margin.right.toInt().toString(),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    setState(() {
                      widget.settings.margin = widget.settings.margin
                          .copyWith(right: double.tryParse(value) ?? 0);
                    });
                    widget.onChanged(widget.settings);
                  },
                ),
              ),
              SizedBox(width: 4),
              SizedBox(
                width: 26,
                child: TextFormField(
                  initialValue:
                      widget.settings.margin.bottom.toInt().toString(),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    setState(() {
                      widget.settings.margin = widget.settings.margin
                          .copyWith(bottom: double.tryParse(value) ?? 0);
                    });
                    widget.onChanged(widget.settings);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: widget.settings.hideNavBar,
                onChanged: (value) {
                  setState(() {
                    widget.settings.hideNavBar = value;
                  });
                  widget.onChanged(widget.settings);
                },
              ),
              Text("Hide Navigation Bar"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: widget.settings.resizeToAvoidBottomInset,
                onChanged: (value) {
                  setState(() {
                    widget.settings.resizeToAvoidBottomInset = value;
                  });
                  widget.onChanged(widget.settings);
                },
              ),
              Text("Resize to avoid bottom inset"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: widget.settings.stateManagement,
                onChanged: (value) {
                  setState(() {
                    widget.settings.stateManagement = value;
                  });
                  widget.onChanged(widget.settings);
                },
              ),
              Text("State Management"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: widget.settings.handleAndroidBackButtonPress,
                onChanged: (value) {
                  setState(() {
                    widget.settings.handleAndroidBackButtonPress = value;
                  });
                  widget.onChanged(widget.settings);
                },
              ),
              Text("Handle Android Back Button Press"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: widget.settings.popAllScreensOnTapOfSelectedTab,
                onChanged: (value) {
                  setState(() {
                    widget.settings.popAllScreensOnTapOfSelectedTab = value;
                  });
                  widget.onChanged(widget.settings);
                },
              ),
              Text("Pop all screens when\ntapping current tab"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: widget.settings.avoidBottomPadding,
                onChanged: (value) {
                  setState(() {
                    widget.settings.avoidBottomPadding = value;
                  });
                  widget.onChanged(widget.settings);
                },
              ),
              Text("Avoid bottom padding"),
            ],
          ),
        ],
      ),
    );
  }
}
