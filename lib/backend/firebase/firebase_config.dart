import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAPpvCGsaaFHKQijG0YfQQUoYLYDPm4M5U",
            authDomain: "sua-fabrica-5c49d.firebaseapp.com",
            projectId: "sua-fabrica-5c49d",
            storageBucket: "sua-fabrica-5c49d.appspot.com",
            messagingSenderId: "955908251589",
            appId: "1:955908251589:web:8f2d13e7b0115851d8f5ac",
            measurementId: "G-P1Z2YNM6Y9"));
  } else {
    await Firebase.initializeApp();
  }
}
