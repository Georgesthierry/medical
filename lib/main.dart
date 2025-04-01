import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical/common/utils/kstrings.dart';
import 'package:medical/src/authentification/controlleur/auth_notifier.dart';

import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:medical/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:medical/src/favorites/controleur/favorite_notifier.dart';
import 'package:medical/src/home/controlleur/schedulecontroller.dart';
import 'package:medical/src/home/controlleur/weekcontrolleur.dart';
import 'package:medical/src/message/controleur/message_notifier.dart';
import 'package:medical/src/splashscreen/views/splashscreen.dart';
import 'package:provider/provider.dart';

import 'common/services/certifiation.dart';
import 'common/utils/app_routes.dart';
import 'src/reservation/controlleur/tab_controlleur_notifier.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeDateFormatting('fr', null);
  HttpOverrides.global = MyHttpOverrides();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> TabIndexNotifier() ),
      ChangeNotifierProvider(create: (_)=> AuthNotifier() ),
      ChangeNotifierProvider(create: (_)=> TabControllerProvider() ),
      ChangeNotifierProvider(create: (_)=> WeekController() ),
      ChangeNotifierProvider(create: (_)=> ScheduleProvider() ),
      ChangeNotifierProvider(create: (_)=> DoctorNotifier() ),
      ChangeNotifierProvider(create: (_)=> FavoritesNotifier() ),
      ChangeNotifierProvider(create: (_)=> MessageNotifier() ),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: screenSize,
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppText.kAppName,
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
              useMaterial3: true,
            ),
            routerConfig: router,
          );
        },
        child: const Splashscreen());
  }
}

