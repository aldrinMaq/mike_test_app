import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mike_test_app/view/screen/authentication/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        name: 'mike-test-app-e83e8',
        options: const FirebaseOptions(
            apiKey: 'AIzaSyA-LV2qbL63Zgc3jf5X2PmgBucWB2AcfAI',
            appId: '1:23065635694:android:cde83942f4f1277a9d2f7f',
            messagingSenderId: '23065635694',
            projectId: 'mike-test-app-e83e8',
            storageBucket: 'gs://mike-test-app-e83e8.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegisterScreen(),
    );
  }
}
