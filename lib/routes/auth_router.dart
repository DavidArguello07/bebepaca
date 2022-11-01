import 'package:bebepaca/auth/ui/screens/login.dart';
import 'package:bebepaca/auth/ui/screens/register.dart';
import 'package:bebepaca/routes/fade_transition_route.dart';
import 'package:flutter/cupertino.dart';

class AuthRoutes {
  static const String register = 'auth/register';
  static const String login = 'auth/login';
}

class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return Navigator(
      key: navigatorKey,
      initialRoute: AuthRoutes.login,
      observers: [HeroController()],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AuthRoutes.login:
            return FadeTransitionRoute(page: const Login());
          case AuthRoutes.register:
            return FadeTransitionRoute(page: const Register());
          default:
            return null;
        }
      },
    );
  }
}
