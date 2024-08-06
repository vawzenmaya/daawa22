import 'dart:io';

import 'package:daawatok/authentication/authentication_controller.dart';
import 'package:daawatok/authentication/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyDFfx2oQ2D2tL3f0iUwZ26wRGfGE8flCSw", appId: "1:569217851695:android:092df2682437199ded81da", messagingSenderId: "569217851695", projectId: "daawatok-app")
  ).then((value)
  {
    Get.put(AuthenticationController());
  });

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DAAWATOK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
        home: LoginScreen(),
    );
  }
}

