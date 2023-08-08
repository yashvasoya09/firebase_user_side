import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_user_side/screen/view/home%20screen.dart';
import 'package:firebase_user_side/screen/view/viewproduct_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
       '/':(p0) => homeScreen(),
       'viewProduct':(p0) => viewProductScreen(),
     },
    ),
  );
}