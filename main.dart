import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/sign_in.dart';
import 'pages/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAuDTui5eyd0DuVsyABiAVYfkaOljyuTzQ",
          projectId: "fir-b7e30",
          messagingSenderId: "497574610285",
          appId: "1:497574610285:web:b4da763c4f98314e500664",

      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
