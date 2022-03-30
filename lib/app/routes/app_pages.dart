import 'package:get/get.dart';
import 'package:scool/app/bindings/appdata_binding.dart';
import 'package:scool/app/bindings/login_binding.dart';
import 'package:scool/app/ui/android/address_cia_page.dart';
import 'package:scool/app/ui/android/address_prof_page.dart';
import 'package:scool/app/ui/android/dados_cia_page.dart';
import 'package:scool/app/ui/android/dados_prof_page.dart';
import 'package:scool/app/ui/android/done_page.dart';
import 'package:scool/app/ui/android/home_tab.dart';
import 'package:scool/app/ui/android/how_profile_page.dart';
import 'package:scool/app/ui/android/initial_page.dart';
import 'package:scool/app/ui/android/signup_cia_page.dart';
import 'package:scool/app/ui/android/signup_member_page.dart';
import 'package:scool/app/ui/android/login_page.dart';
import 'package:scool/app/ui/android/register_page.dart';
import 'package:scool/app/ui/android/signup_prof_page.dart';
import 'package:scool/app/ui/android/main_screen_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
    ),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => HomeTabPage(),
        binding: AppDataBinding()),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOW,
      page: () => HowProfilePage(),
    ),
    GetPage(
      name: Routes.SIGNUPMEMBER,
      page: () => SignupMemberPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUPROF,
      page: () => SignupProfPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.DADOSPROF,
      page: () => DadosProfPage(),
    ),
    GetPage(
      name: Routes.ADDRESSPROF,
      page: () => AddressProfPage(),
    ),
    GetPage(
      name: Routes.DADOSCIA,
      page: () => DadosCiaPage(),
    ),
    GetPage(
      name: Routes.ADDRESSCIA,
      page: () => AddressCiaPage(),
    ),
    GetPage(
      name: Routes.SIGNUPCIA,
      page: () => SignupCiaPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.DONE,
      page: () => DonePage(),
    ),
    GetPage(
      name: Routes.MAINSCREEN,
      page: () => MainScreen(),
      binding: AppDataBinding(),
    ),
  ];
}
