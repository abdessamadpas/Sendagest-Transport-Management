// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required List<String> tabBarItems,
    required List<Widget> tabViewItems,
    Color? selectedCardColor,
    Color? selectedTitleColor,
    Color? unSelectedCardColor,
    Color? unSelectedTitleColor,
    double? selectedTabElevation,
    Duration? duration,
    RoundedRectangleBorder? shape,
    double? tabBarItemExtend,
    EdgeInsets? padding,
    TabBarLocation? tabBarLocation,
    double? tabBarItemHeight,
    double? tabBarItemWidth,
    double? tabViewItemHeight,
    double? tabViewItemWidth,
    TextStyle? titleStyle,
  })  : _selectedCardColor = selectedCardColor,
        _unSelectedCardColor = unSelectedCardColor,
        _selectedTitleColor = selectedTitleColor,
        _unSelectedTitleColor = unSelectedTitleColor,
        _tabBarItems = tabBarItems,
        _tabViewItems = tabViewItems,
        _duration = duration,
        _shape = shape,
        _tabBarItemExtend = tabBarItemExtend,
        _padding = padding,
        _tabBarLocation = tabBarLocation,
        _selectedTabElevation = selectedTabElevation,
        _tabBarItemHeight = tabBarItemHeight,
        _tabBarItemWidth = tabBarItemWidth,
        _tabViewItemHeight = tabViewItemHeight,
        _tabViewItemWidth = tabViewItemWidth,
        _titleStyle = titleStyle,
        super(key: key);

  final Color? _selectedCardColor;
  final Color? _unSelectedCardColor;
  final Color? _selectedTitleColor;
  final Color? _unSelectedTitleColor;

  final double? _selectedTabElevation;
  final double? _tabBarItemHeight;
  final double? _tabBarItemWidth;
  final double? _tabViewItemHeight;
  final double? _tabViewItemWidth;
  final TextStyle? _titleStyle;

  final List<String> _tabBarItems;
  final List<Widget> _tabViewItems;
  final Duration? _duration;
  final RoundedRectangleBorder? _shape;
  final double? _tabBarItemExtend;
  final EdgeInsets? _padding;
  final TabBarLocation? _tabBarLocation;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

enum TabBarLocation {
  top,
  bottom,
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  void _changeSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex,
          duration: widget._duration ?? const Duration(milliseconds: 200),
          curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget._tabBarLocation == TabBarLocation.top ||
                widget._tabBarLocation == null
            ? _TabBarItems(context)
            : const SizedBox.shrink(),
        _TabViewItems(),
        widget._tabBarLocation == TabBarLocation.bottom
            ? _TabBarItems(context)
            : const SizedBox.shrink(),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox _TabViewItems() {
    return SizedBox(
      height:
          widget._tabViewItemHeight ?? MediaQuery.of(context).size.height * 0.8,
      width: widget._tabViewItemWidth ?? MediaQuery.of(context).size.width,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) => _changeSelectedIndex(value),
        children: widget._tabViewItems,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding _TabBarItems(BuildContext context) {
    return Padding(
        padding: widget._padding ??
            EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03,
            ),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: widget._tabBarItemWidth ??
                    MediaQuery.of(context).size.width,
                height: widget._tabBarItemHeight ??
                    MediaQuery.of(context).size.height * 0.07,
                child: ListView.builder(
                  itemCount: widget._tabBarItems.length,
                  scrollDirection: Axis.horizontal,
                  itemExtent: widget._tabBarItemExtend ??
                      MediaQuery.of(context).size.width * 0.3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => setState(() {
                              _changeSelectedIndex(index);
                            }),
                        child: Expanded(
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03,
                                  right:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF4D70A6).withOpacity(.2),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(-20, -20),
                                        blurRadius: 60,
                                        color: Colors.white,
                                        inset: true,
                                      ),
                                      BoxShadow(
                                        offset: Offset(20, 20),
                                        color: Color(0xFFF1F3F6),
                                        spreadRadius: -12.0,
                                        blurRadius: 12.0,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.film,
                                    color: Color(0xFF4D70A6),
                                  ),
                                ),
                              ),

                              // InnerShadow(
                              //   color: Color(0xFF4D70A6).withOpacity(.2),
                              //   offset: Offset(5, 5),
                              //   blur: 2,
                              //   child: Container(
                              //     height: ScreenUtil().setHeight(130),
                              //     width: ScreenUtil().setHeight(130),
                              //     margin: EdgeInsets.symmetric(vertical: 30),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: Color(0xFFF1F3F6),
                              //     ),
                              //     child: Text(
                              //       'wewe'
                              //     ),
                              //   ),
                              // ),
                              Positioned(
                                bottom: 10,
                                left: 18,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFF4D70A6)),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class _CustomTabBarColor {
  final Color unSelectedCardColor = const Color.fromARGB(255, 34, 34, 34);
  final Color selectedCardColor = Color.fromARGB(255, 47, 230, 214);
  final Color selectedTitleColor = Colors.white;
  final Color unSelectedTitleColor = Colors.white;
}
