import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/homescreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: homescreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.white,
       ),
    ),
  ));
}

