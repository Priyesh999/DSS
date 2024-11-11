import 'dart:io';
import 'package:dss_code/utils/internet/internet_observer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'app_route/app_pages.dart';
import 'db/app_preferences.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init('DSS');
  // Initialize preferences
  await AppPrefrence().init();

  runApp(StreamBuilder<dynamic>(
      initialData: false,
      stream: ConnectionStatusSingleton.getInstance()
          .connectionChangeController
          .stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data) {
          return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())));
        }
        return GetMaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              breakpoints: [
                const ResponsiveBreakpoint.resize(400, name: MOBILE),
                const ResponsiveBreakpoint.resize(850, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ],
            ),
            title: "Dss",
            // translations: AppTranslations(),
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.SPLASH,
            getPages: AppPages.routes,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'inter'));
      }));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}