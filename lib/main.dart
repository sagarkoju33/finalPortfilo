import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDJ-SrRdnsrmICMD8XcBBdXJMAXRxnoyUU",
      authDomain: "portfolio-e8196.firebaseapp.com",
      projectId: "portfolio-e8196",
      storageBucket: "portfolio-e8196.firebasestorage.app",
      messagingSenderId: "647969668360",
      appId: "1:647969668360:web:d47fceb978f6976a20c0bd",
      measurementId: "G-JXLJD6FYEJ",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(titleSmall: const TextStyle(color: bodyTextColor)),
      ),
      home: const SplashView(),
    );
  }
}
