import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:regenki/Model/Activity.dart';

class NotificationService {
  void createNotification(Activity activity) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "key1",
            title: activity.category,
            body: activity.title,

            //bigPicture:"asset://"+activity.sticker,
          hideLargeIconOnExpand: false,
          largeIcon: 'asset://"+activity.sticker',
            bigPicture: 'https://media-cdn.tripadvisor.com/media/photo-s/15/dd/20/61/al-punto.jpg',
          notificationLayout: NotificationLayout.BigPicture
            ),schedule: NotificationCalendar.fromDate(date: activity.dateTime)
        );
  }
  Future<void> cancelNotification(int id)async{
    await AwesomeNotifications().cancel(id);
  }
}
