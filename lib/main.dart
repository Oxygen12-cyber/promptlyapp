import 'package:aipromptapp/pages/homepage.dart';
import 'package:aipromptapp/pages/loginpage.dart';
import 'package:aipromptapp/pages/newpostpage.dart';
import 'package:aipromptapp/pages/profilepage.dart';
import 'package:aipromptapp/pages/signuppage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) => const ProviderScope(child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const AuthGate(),
      initialRoute: '/loginPage',
      routes: {
        "/homePage": (context) => const HomePage(),
        "/profilePage": (context) => const ProfilePage(),
        "/loginPage": (context) => const LoginPage(),
        "/signupPage": (context) => const SignupPage(),
        "/newPostPage": (context) => const NewPostPage(),

      },
    );
  }
}
