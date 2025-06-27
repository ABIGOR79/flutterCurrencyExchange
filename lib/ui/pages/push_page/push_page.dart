// import 'package:flutter/material.dart';
// import 'package:flutter_app/ui/pages/push_page/push_page_cubit.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PushPage extends StatefulWidget {
//   const PushPage({super.key});

//   @override
//   State<PushPage> createState() => _PushPageState();
// }

// class _PushPageState extends State<PushPage> {
//   final cubit = PushCubit();

//   @override
//   void initState() {
//     super.initState();
//     _requestPermission(); // Запрос разрешения при входе
//   }

//   Future<void> _requestPermission() async {
//     final status = await Permission.notification.status;
//     if (status.isDenied || status.isPermanentlyDenied) {
//       await Permission.notification.request();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Пуш-уведомления')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => cubit.sendPush(),
//           child: Text('Отправить пуш'),
//         ),
//       ),
//     );
//   }
// }
