import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabnavigator/tabnavigator.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/bookings.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/home_page.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/profile.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/services_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.home;

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.home: () {
      return HomePage();
    },
    AppTab.services: () {
      return ServicesPage();
    },
    AppTab.booking: () {
      return const BookingPage();
    },
    AppTab.profile: () {
      return ProfilePage();
    }
  };

  Widget _buildBody() {
    return TabNavigator(
      initialTab: _initTab,
      selectedTabStream: tabStream,
      mappedTabs: _map,
    );
  }

  Widget _buildbottomNavigationBar() {
    return StreamBuilder<AppTab>(
      stream: tabStream,
      initialData: _initTab,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair_sharp, color: Colors.white),
              label: 'Services',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online_outlined, color: Colors.white),
              label: 'Bookings',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Profile',
              backgroundColor: primaryColor,
            ),
          ],
          currentIndex: snapshot.hasData ? snapshot.data!.value : 0,
          onTap: (value) => _tabController.sink.add(AppTab.byValue(value)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildbottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    _tabController.close();
    super.dispose();
  }
}

class AppTab extends TabType {
  const AppTab._(int value) : super(value);

  static const home = AppTab._(0);
  static const services = AppTab._(1);
  static const booking = AppTab._(2);
  static const profile = AppTab._(3);

  static AppTab byValue(int value) {
    switch (value) {
      case 0:
        return home;
      case 1:
        return services;
      case 2:
        return booking;
      case 3:
        return profile;
      default:
        throw Exception('no tab for such value');
    }
  }
}
