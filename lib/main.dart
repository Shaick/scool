import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  await GetStorage.init('login_firebase');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "Ifit",
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      locale: Locale('pt', 'BR'),
    ),
  );
}
