import 'package:shiftus_admin/Pages/Skeleton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDV-ZfbqP8bVp7Cr1iwDDpbJ4yQWY2QQ3o",
        authDomain: "shiftus-ac06c.firebaseapp.com",
        databaseURL: "https://shiftus-ac06c-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "shiftus-ac06c",
        storageBucket: "shiftus-ac06c.appspot.com",
        messagingSenderId: "847719498318",
        appId: "1:847719498318:web:0743c386a38705d2b3791f"
    ),
  );
  runApp(const MyApp());
  // await windowManager.setSize(Size(800, 600));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CargoConnect',
      theme: ThemeData(
        fontFamily: 'Berserkersmaller',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        checkboxTheme: CheckboxThemeData(
          // checkColor: MaterialStateProperty.all(Colors.black),
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      home: const Skeleton(),
    );
  }
}