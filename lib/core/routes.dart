import 'package:get/get.dart';
import 'package:portfolio/binding/portfoilo_binding.dart';
import 'package:portfolio/binding/splash_binding.dart';
import 'package:portfolio/view/home/home.dart';
import 'package:portfolio/view/splash/splash_view.dart';
import 'package:portfolio/view/unknown_page.dart';

abstract class Routes {
  Routes._();

  static const unknown = "/unknown";
  static const homeScreen = "/homeScreen";
  static const splashScreen = "/splashScreen";

  static final unknownPage = GetPage(
    name: Routes.unknown,
    page: () => const UnknownPage(),
  );

  static final routePage = [
    GetPage(
      name: homeScreen,
      page: () => const HomePage(),
      binding: PortfoiloBinding(),
    ),
    GetPage(
      name: splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    // GetPage(
    //   name: addMoreDirector,
    //   page: () => const AddMoreDirector(),
    //   binding: AddMoreDirectorBinding(),
    // ),
  ];
}
