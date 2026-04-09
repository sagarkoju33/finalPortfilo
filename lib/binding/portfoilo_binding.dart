import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';

class PortfoiloBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut<PortfolioController>(() => PortfolioController())];
  }
}
