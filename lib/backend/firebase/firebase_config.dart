import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAd2AI3yA-vVk9eVOX0MAU0WsBoHA0_HDc",
            authDomain: "count-me-in-f7e83.firebaseapp.com",
            projectId: "count-me-in-f7e83",
            storageBucket: "count-me-in-f7e83.appspot.com",
            messagingSenderId: "235740299041",
            appId: "1:235740299041:web:af37b772f279a215484860"));
  } else {
    await Firebase.initializeApp();
  }
}
