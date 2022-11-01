import 'package:bebepaca/layout/ui/screens/splash_screen.dart';
import 'package:bebepaca/routes/auth_router.dart';
import 'package:bebepaca/routes/fade_transition_route.dart';
import 'package:flutter/cupertino.dart';

class SplashRouters {
  static const String splash = '/';
  static const String auth = '/auth';
}

class SlashRouter extends StatelessWidget {
  const SlashRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return Navigator(
      key: navigatorKey,
      initialRoute: SplashRouters.splash,
      observers: [HeroController()],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SplashRouters.splash:
            return FadeTransitionRoute(page: const SplashScreen());
          case SplashRouters.auth:
            return FadeTransitionRoute(page: const AuthRouter(), duration: const Duration(milliseconds: 1200));
          default:
            return null;
        }
      },
    );
  }
}
