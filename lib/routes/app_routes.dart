import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/services_screen.dart';
import '../screens/booking_screen.dart';
import '../screens/bookings_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String services = '/services';
  static const String booking = '/booking';
  static const String bookings = '/bookings';
  static const String favorites = '/favorites';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case services:
        return MaterialPageRoute(
          builder: (_) => const ServicesScreen(),
        );

      case booking:
        return MaterialPageRoute(
          builder: (_) => const BookingScreen(),
        );

      case bookings:
        return MaterialPageRoute(
          builder: (_) => const BookingsScreen(),
        );

      case favorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritesScreen(),
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}