import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GlobalFunction.configLoading();
  runApp(
    GetMaterialApp(
      title: "Intaran Fashion",
      theme: ThemeData(
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: GlobalColor.colorOrange),
          appBarTheme: const AppBarTheme(color: GlobalColor.primaryColor),
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: GlobalColor.primaryColorBackground),
      initialRoute: AppPages.INITIAL,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
    ),
  );
}
