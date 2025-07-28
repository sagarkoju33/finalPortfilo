import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/routes.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view%20model/getx_controllers/screen_size_controller.dart';
import 'package:portfolio/view/splash/splash_view.dart';

import 'source/api.service.dart';

void main() async {
   
  // WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyDJ-SrRdnsrmICMD8XcBBdXJMAXRxnoyUU",
  //     authDomain: "portfolio-e8196.firebaseapp.com",
  //     projectId: "portfolio-e8196",
  //     storageBucket: "portfolio-e8196.firebasestorage.app",
  //     messagingSenderId: "647969668360",
  //     appId: "1:647969668360:web:d47fceb978f6976a20c0bd",
  //     measurementId: "G-JXLJD6FYEJ",
  //   ),
  // );
  runApp(const MyApp());
}

initServices() async {
  Get.put(ApiService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // unknownRoute: Routes.unknownPage,
      getPages: Routes.routePage,
      initialRoute: Routes.splashScreen,
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
