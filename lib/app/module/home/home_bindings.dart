import 'package:get/get.dart';
import 'package:moment_game/app/module/home/home_controller.dart';

class HomeBindings extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
  }

}