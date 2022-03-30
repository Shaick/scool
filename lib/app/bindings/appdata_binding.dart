import 'package:get/get.dart';
import 'package:scool/app/controller/appData_controller.dart';

class AppDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppData>(() => AppData());
  }
}
