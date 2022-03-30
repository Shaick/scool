import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scool/app/data/model/user_model.dart';

class HomeController extends GetxController {
  final UserModel user = Get.arguments;
  GetStorage box = GetStorage('login_firebase');

/*   @override
  void onInit() {
    super.onInit();
  } */

}
