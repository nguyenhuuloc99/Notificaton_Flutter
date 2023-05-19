import 'package:flutter/material.dart';
import 'package:flutter_fire_message/Tab_two.dart';
import 'package:flutter_fire_message/tab_one.dart';
import 'notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  NotificationService notificationService = NotificationService();
  late TabController _tabController;
  int indexSelected = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    notificationService.requestNotificationPermission();
    notificationService.forgroundMessage();
    notificationService.firebaseInit(context);
    notificationService.setupInteractMessage(context);
    notificationService.isTokenRefresh();
    notificationService.getDeviceToken().then((value) => {});
  }

  static  List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.red,
          indicatorColor: Colors.amberAccent,
          onTap: (indext) {
          },
          tabs: myTabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
          TabOne(),
          TabTwo()
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  void onTabReselted(indext) {
    print("$indext resled");
  }
}
