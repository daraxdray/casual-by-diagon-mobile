import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../utils/colors.dart';


class FirebaseService {
  FlutterLocalNotificationsPlugin fln =  FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', //
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true,

  );
  FirebaseMessaging fbm = FirebaseMessaging.instance;


  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage msg)async {
    // print("Background message detected");
  }


  Future registerNotification(BuildContext context) async {
    // 1. Initialize the Firebase app

    // 2. Instantiate Firebase Messaging
    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await fbm.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // TODO: handle the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          fln.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription:channel.description,
                  color: AppColors.primary,
                  // TODO add a proper drawable resource to android, for now using
                  //      one that already exists in example app.
                  icon: "@mipmap/logo",
                ),
              ));
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {

          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(notification.title ?? "Diagon"),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(notification.body ?? "We Love You")],
                    ),
                  ),
                );
              });
        }
      });



      // getToken();


    } else {
      // print('TrUser declined or has not accepted permission');
    }
  }
}