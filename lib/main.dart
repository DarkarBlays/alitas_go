
import 'package:alitas_go/domain/controller/controluserf.dart';
import 'package:alitas_go/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  Get.put(ControlAuthFirebase());
  runApp(const App());
}