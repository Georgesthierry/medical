// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/src/authentification/views/login_screen.dart';
import 'package:medical/src/authentification/views/register_screen.dart';
import 'package:medical/src/authentification/views/set_password.dart';
import 'package:medical/src/chats/views/chat_screen.dart';
import 'package:medical/src/doctors/views/doctor_info.dart';
import 'package:medical/src/doctors/views/doctors_screen.dart';
import 'package:medical/src/doctors/views/doctorscreenlist.dart';
import 'package:medical/src/entrypoint/views/entrypoint.dart';
import 'package:medical/src/favorites/views/favorite_screen.dart';
import 'package:medical/src/home/views/home_screen.dart';
import 'package:medical/src/message/widgets/message_widget_liste.dart';
import 'package:medical/src/notifications/views/notification_screen.dart';
import 'package:medical/src/profile/views/profile_screen.dart';
import 'package:medical/src/profile/widgets/profile_widget_page.dart';
import 'package:medical/src/profile/widgets/settings_widget_page.dart';
import 'package:medical/src/rating/views/rating_screen.dart';
import 'package:medical/src/schedule/views/doctor_profile.dart';
import 'package:medical/src/schedule/views/schedule_screen.dart';
import 'package:medical/src/schedule/views/scheduledetailsscreen.dart';
import 'package:medical/src/splashscreen/views/splashscreen.dart';
import 'package:medical/src/welcome/views/welcome_screen.dart';

import '../../src/message/views/message_screen.dart';
import '../../src/profile/widgets/notification_settings.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/setpassword',
      builder: (context, state) => const SetPassword(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/entrypoint',
      builder: (context, state) => AppEntrypoint(),
    ),
    GoRoute(
      path: '/doctor',
      builder: (context, state) => const DoctorsScreen(),
    ),
    GoRoute(
      path: '/doctor/:id',
      builder: (context, state) {
        final doctorId = int.parse(state.pathParameters['id']!);
        return DoctorInfo(doctorId: doctorId);
      },
    ),
    GoRoute(
      path: '/rating',
      builder: (context, state) => const RatingScreen(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsWidgetPage(),
    ),
    GoRoute(
      path: '/profilepage',
      builder: (context, state) => const ProfileWidgetPage(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationSettings(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationScreen(),
    ),

    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/doctorprofile',
      builder: (context, state) => const DoctorProfile(),
    ),
    GoRoute(
      path: '/schedule',
      builder: (context, state) => const ScheduleScreen(),
    ),
    GoRoute(
      path: '/scheduledetail',
      builder: (context, state) => const ScheduleDetailsScreen(),
    ),
    GoRoute(
      path: '/doctorlists',
      builder: (context, state) => DoctorListScreen(),
    ),
    GoRoute(
      path: '/message/:doctorName',
      builder: (context, state) {
        final doctorName = state.pathParameters['doctorName'] ?? 'Unknown Doctor';
        return MessageScreen(doctorName: doctorName);
      },
    ),
    GoRoute(
      path: '/messagelist',
      builder: (context, state) => const MessageWidgetListe(),
    ),
    // GoRoute(
    //   path: '/categories',
    //   builder: (context, state) => const CategoriesPage(),
    // ),
    // GoRoute(
    //   path: '/category',
    //   builder: (context, state) => const CategoryPage(),
    // ),
    // //
    // // GoRoute(
    // //   path: '/addaddress',
    // //   builder: (context, state) => const AddAddress(),
    // // ),
    // //
    // GoRoute(
    //   path: '/addresses',
    //   builder: (context, state) => const ShippingAddress(),
    // ),
    // //
    // GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const NotificationPage(),
    // ),
    // //
    // //  GoRoute(
    // //   path: '/tracking',
    // //   builder: (context, state) => const TrackOrderPage(),
    // // ),
    // //
    // // GoRoute(
    // //   path: '/checkout',
    // //   builder: (context, state) => const CheckoutPage(),
    // // ),
    // //
    // //   GoRoute(
    // //   path: '/successful',
    // //   builder: (context, state) => const SuccessfulPayment(),
    // // ),
    // //
    // //   GoRoute(
    // //   path: '/failed',
    // //   builder: (context, state) => const FailedPayment(),
    // // ),
    // //
    // GoRoute(
    //   path: '/product/:id',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final productId = state.pathParameters['id'];
    //     return ProductPage(productId: productId.toString());
    //   },
    // ),
  ],
);

GoRouter get router => _router;
