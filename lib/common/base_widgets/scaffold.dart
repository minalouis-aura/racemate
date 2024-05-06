import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/constants/dimensions.dart';
import 'package:racemate/constants/icons.dart';
import 'package:racemate/constants/images.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class BaseScaffold extends ConsumerWidget {
  final List<Widget> tabs;
  final List<Widget> tabBarItems;

  BaseScaffold({required this.tabs, required this.tabBarItems, super.key})
      : assert(tabBarItems.isNotEmpty, 'TabBar items can not be empty'),
        assert(tabs.isNotEmpty, 'Tabs can not be empty'),
        assert(tabBarItems.length == tabs.length,
            'TabBar items and the tabs must be of the same length');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(Images.fullLogo, width: 119.0, height: 24.0, fit: BoxFit.fill,),
          flexibleSpace: Image.asset(Images.appbarBackground, fit: BoxFit.cover, height: 200.0,),
          backgroundColor: Colors.transparent,
          actions: [
            Icon(Icons.notifications, color: '#FFB715'.color,),
            24.0.hSpace,
            Image.asset(CustomIcons.profile, width: 32.0, height: 32.0,),
            24.0.hSpace,
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 55.0,
                color: '#1C325F'.color,
                child: TabBar(
                  tabs: tabs,
                  indicatorColor: '#FFB715'.color,
                  indicatorWeight: 5.0,
                  dividerHeight: 5.0,
                  dividerColor: '#4B5B8D'.color,
                  unselectedLabelStyle: 16.0.thickStyle,
                  labelStyle: 18.0.thickStyle,
                  unselectedLabelColor: '#CDD3E4'.color,
                  labelPadding: EdgeInsets.symmetric(vertical: 15.5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: '#FFFFFF'.color,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kVerticalScreenPadding),
                  child: TabBarView(children: tabBarItems),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Container(
        //   decoration: BoxDecoration(
        //     color: '#FFB715'.color,
        //     shape: BoxShape.circle,
        //   ),
        //   child: Image.asset(Images.logo),
        // ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            border: Border.all(color: '#CDD3E4'.color)
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle: 12.0.mediumStyle.copyWith(color: '#8E9BC3'.color),
            unselectedLabelStyle: 12.0.mediumStyle.copyWith(color: '#8E9BC3'.color),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(CustomIcons.home, width: 24.0, height: 24.0,), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Image.asset(CustomIcons.train, width: 24.0, height: 24.0,), label: 'Train'),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 54.0,
                    width: 54.0,
                    padding: 12.0.allPadding,
                    decoration: BoxDecoration(
                      color: '#FFB715'.color,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Images.logo),
                  ), label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(CustomIcons.explore, width: 24.0, height: 24.0,), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Image.asset(CustomIcons.statistics, width: 24.0, height: 24.0,), label: 'Me'),
            ],
          ),
        ),
      ),
    );
  }
}
