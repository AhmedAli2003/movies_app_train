import 'package:flutter/material.dart';
import 'package:movies_app_train/app/app.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app_train/firebase_options.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
