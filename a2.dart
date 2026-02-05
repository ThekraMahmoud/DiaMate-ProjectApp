// import 'package:flutter/material.dart';

// class RoleSelectScreen extends StatelessWidget {
//   const RoleSelectScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//   // child: Scaffold(
//         appBar: AppBar(title: const Text('اختر نوع الحساب')),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('تم اختيار دكتور')),
//                     );
//                   },
//                   child: const Text('دكتور'),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('تم اختيار مريض')),
//                     );
//                   },
//                   child: const Text('مريض'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
