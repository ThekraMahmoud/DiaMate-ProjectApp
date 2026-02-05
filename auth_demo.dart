// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyFirebaseApp());
// }

// class MyFirebaseApp extends StatelessWidget {
//   const MyFirebaseApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'سكرّي - فايربيس',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF1B998B),
//         ),
//         useMaterial3: true,
//       ),
//       home: const WelcomeScreen(),
//     );
//   }
// }

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 1200), () {
//       if (!mounted) return;
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const AuthScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(24),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Text(
//               'مرحبا بك',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'تطبيق متابعة السكري',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white70,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   bool _isLogin = true;
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;

//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//     final name = _nameController.text.trim();

//     try {
//       if (_isLogin) {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//       } else {
//         final cred = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);

//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(cred.user!.uid)
//             .set({
//           'name': name,
//           'email': email,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//       }

//       if (!mounted) return;
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const HomeScreen()),
//       );
//     } on FirebaseAuthException catch (e) {
//       final msg = e.message ?? 'حدث خطأ في تسجيل الدخول/التسجيل';
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(_isLogin ? 'تسجيل الدخول' : 'إنشاء حساب'),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               ToggleButtons(
//                 isSelected: [_isLogin, !_isLogin],
//                 onPressed: (index) {
//                   setState(() {
//                     _isLogin = index == 0;
//                   });
//                 },
//                 borderRadius: BorderRadius.circular(12),
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//                     child: Text('دخول'),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//                     child: Text('تسجيل'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     if (!_isLogin) ...[
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: const InputDecoration(
//                           labelText: 'الاسم',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().length < 2) {
//                             return 'الاسم قصير';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 12),
//                     ],
//                     TextFormField(
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: const InputDecoration(
//                         labelText: 'البريد الإلكتروني',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || !value.contains('@')) {
//                           return 'أدخل بريد صحيح';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 12),
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'كلمة المرور',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().length < 6) {
//                           return 'كلمة المرور 6 أحرف على الأقل';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _submit,
//                         child: Text(_isLogin ? 'دخول' : 'إنشاء حساب'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الصفحة الثانية'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//               if (context.mounted) {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (_) => const AuthScreen()),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             final user = snapshot.data;
//             if (user == null) {
//               return const Text('لا يوجد مستخدم');
//             }
//             return Text('مرحبًا ${user.email}');
//           },
//         ),
//       ),
//     );
//   }

import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

class Mempar {
  String name;
  int age;
  String Type;
  Mempar({required this.name, required this.age, required this.Type});
}
