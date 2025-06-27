// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:timezone/data/latest_all.dart' as tzData;
// import 'package:timezone/timezone.dart' as tz;

// class PushCubit extends Cubit<void> {
//   final FlutterLocalNotificationsPlugin _notifications =
//       FlutterLocalNotificationsPlugin();

//   PushCubit() : super(null) {
//     _init();
//   }

//   Future<void> _init() async {
//     const AndroidInitializationSettings androidInit =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings settings =
//         InitializationSettings(android: androidInit);
//     await _notifications.initialize(settings);

//     // Инициализация временной зоны
//     tzData.initializeTimeZones();

//     // Запрашиваем разрешение на уведомления при старте
//     final status = await Permission.notification.status;
//     if (status.isDenied || status.isPermanentlyDenied) {
//       await Permission.notification.request();
//     }

//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'channel_id',
//       'Основной канал',
//       description: 'Канал для пуш-уведомлений',
//       importance: Importance.high,
//     );

//     await _notifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }

//   Future<void> sendPush() async {
//     final status = await Permission.notification.status;
//     if (status.isDenied || status.isPermanentlyDenied) {
//       if (status.isPermanentlyDenied) {
//         await openAppSettings();
//       } else {
//         await Permission.notification.request();
//       }
//       return;
//     }

//     final location = tz.getLocation('Europe/Kyiv');
//     final now = tz.TZDateTime.now(location);

//     final scheduledTime =
//         tz.TZDateTime(location, now.year, now.month, now.day, 11, 10);

//     final scheduledTimeToUse = scheduledTime.isBefore(now)
//         ? scheduledTime.add(const Duration(days: 1))
//         : scheduledTime;

//     const NotificationDetails details = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel_id',
//         'Основной канал',
//         channelDescription: 'Канал для уведомлений',
//         importance: Importance.high,
//         priority: Priority.high,
//       ),
//     );

//     await _notifications.zonedSchedule(
//       0,
//       'Доброе утро!',
//       'Это запланированное уведомление в 9 утра',
//       scheduledTimeToUse,
//       details,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
// }
