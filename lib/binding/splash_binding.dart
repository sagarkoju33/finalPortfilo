import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/splash_controller.dart';

class SplashBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut<SplashController>(() => SplashController())];
  }
}
