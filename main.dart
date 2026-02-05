import 'package:flutter/material.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('اختر نوع الحساب')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم اختيار دكتور')),
                    );
                  },
                  child: const Text('دكتور'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم اختيار مريض')),
                    );
                  },
                  child: const Text('مريض'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // هذا السطر هو الذي يشغل الفايربيس
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'jjj Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color.fromARGB(255, 110, 58, 183),
//         ),
//       ),
//       home: const MyHomePage(title: 'prinses thekra'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: const StadiumBorder(),
//         backgroundColor: const Color.fromARGB(255, 20, 21, 21),
//         title: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: const Color.fromARGB(255, 235, 229, 229),
//                 width: 1,
//               ),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
//             child: const Text(
//               'اول برنامج لي في فلاتر',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),

//       body: Center(
//         child: Row(
//           children: [
//             Text('hello world'),
//             SizedBox(width: 20),
//             Text('data'),
//             SizedBox(width: 20),
//             Column(children: [Text('hello world')]),
//           ],
//         ),

//         // color: const Color.fromARGB(255, 14, 14, 14),
//         // child: Container(
//         //   margin: const EdgeInsets.all(20),
//         //   child: Column(
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     crossAxisAlignment: CrossAxisAlignment.stretch,
//         //     children: [
//         //       Container(
//         //         width: 200,
//         //         height: 200,
//         //         decoration: BoxDecoration(
//         //           borderRadius: BorderRadius.circular(20),
//         //           border: Border.all(
//         //             color: const Color.fromARGB(255, 3, 32, 61),
//         //             width: 3,
//         //           ),
//         //         ),
//         //         child: const Center(
//         //           child: Text(
//         //             'HI TO MY WORLD',
//         //             textAlign: TextAlign.center,
//         //             style: TextStyle(
//         //               color: Color.fromARGB(255, 134, 178, 193),
//         //               fontSize: 30,
//         //             ),
//         //           ),
//         //         ),
//         //       ),

//         //       Container(
//         //         decoration: BoxDecoration(
//         //           borderRadius: BorderRadius.circular(100),
//         //           color: const Color.fromARGB(255, 185, 171, 171),
//         //         ),
//         //         width: 30,
//         //         height: 30,
//         //         child: const Center(
//         //           child: Text(
//         //             "THIKRA MAHMOUD SHAMU",
//         //             textAlign: TextAlign.center,
//         //             style: TextStyle(fontSize: 20, color: Colors.white),
//         //           ),
//         //         ),
//         //       ),

//         //       Container(
//         //         width: 200,
//         //         height: 200,
//         //         decoration: BoxDecoration(
//         //           borderRadius: BorderRadius.circular(20),
//         //           border: Border.all(
//         //             color: const Color.fromARGB(255, 3, 32, 61),
//         //             width: 3,
//         //           ),
//         //         ),
//         //         child: const Center(
//         //           child: Text(
//                     // 'WELCOME TO FLUTTER',
//         //             textAlign: TextAlign.center,
//         //             style: TextStyle(
//         //               color: Color.fromARGB(255, 134, 178, 193),
//         //               fontSize: 30,
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//       ),
//     );
//   }
// }



//       //
//       //
//       // Container(
//       //   decoration: BoxDecoration(
//       //     color: const Color.fromARGB(255, 222, 160, 83),
//       //     borderRadius: BorderRadius.circular(19),
//       //     border: BoxBorder.fromBorderSide(
//       //       BorderSide(
//       //         color: const Color.fromARGB(255, 172, 102, 102),
//       //         width: 5,
//       //       ),
//       //     ),
//       //   ),

//       // // color: Color.fromARGB(255, 180, 7, 183),
//       // child: Text(
//       //   'اهلاوسهلا',
//       //   style: TextStyle(
//       //     fontSize: 30,
//       //     color: const Color.fromARGB(255, 255, 255, 255),
//       //   ),
//       // ),
//       // ),
//        //   style: TextStyle(
//       //     fontSize: 30,
//       //     color: const Color.fromARGB(255, 255, 255, 255),
//       //   ),
//       // ),
//       // ),
//        //   style: TextStyle(
//       //     fontSize: 30,
//       //     color: const Color.fromARGB(255, 255, 255, 255),
//       //   ),
//       // ),
//       // ),
   