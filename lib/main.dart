import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mealmingle/admin/admin_login.dart';
import 'package:mealmingle/admin/home_admin.dart';
import 'package:mealmingle/pages/bottom_nav.dart';
import 'package:mealmingle/pages/home.dart';
import 'package:mealmingle/pages/login.dart';
import 'package:mealmingle/pages/onbord.dart';
import 'package:mealmingle/widget/app_const.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishableKey;
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNav(),
    );
  }
}
