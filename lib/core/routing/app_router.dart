import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/routing/navigation_transitions.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/auth/screens/login_screen.dart';
import 'package:deliverzler/core/screens/no_internet_connection_screen.dart';
import 'package:deliverzler/core/screens/splash_screen.dart';
import 'package:deliverzler/general/settings/screens/language_screen.dart';
import 'package:deliverzler/general/settings/screens/settings_screen.dart';
import 'package:deliverzler/modules/map/screens/map_screen.dart';
import 'package:deliverzler/modules/profile/screens/profile_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Core
      case RoutePaths.coreSplash:
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case RoutePaths.coreNoInternet:
        final args = settings.arguments as Map?;
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => NoInternetConnection(
            offAll: args?['offAll'],
          ),
          settings: settings,
        );

      //Auth
      case RoutePaths.authLogin:
        return NavigationFadeTransition(
          const LoginScreen(),
          settings: settings,
          transitionDuration: const Duration(seconds: 1),
        );

      //Settings
      case RoutePaths.settings:
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => const SettingsScreen(),
          settings: settings,
        );

      case RoutePaths.settingsLanguage:
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => const LanguageScreen(),
          settings: settings,
        );

      //Home
      case RoutePaths.home:
        return NavigationFadeTransition(
          const HomeScreen(),
          settings: settings,
        );

      //Profile
      case RoutePaths.profile:
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );

      //Map
      case RoutePaths.map:
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => const MapScreen(),
          settings: settings,
        );

      default:
        return platformPageRoute(
          context: NavigationService.context,
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
