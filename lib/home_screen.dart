import 'package:flutter/material.dart';
import 'notification_service.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
   notificationService.requestNotificationPermission();
   notificationService.forgroundMessage();
   notificationService.firebaseInit(context);
   notificationService.setupInteractMessage(context);
   notificationService.isTokenRefresh();
   notificationService.getDeviceToken().then((value) => {

   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification"),),

    );
  }
}
