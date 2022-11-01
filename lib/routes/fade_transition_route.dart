import 'package:flutter/cupertino.dart';

class FadeTransitionRoute extends PageRouteBuilder {
  final Widget page;
  final Duration? duration;

  FadeTransitionRoute({required this.page, this.duration})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
                page,
            transitionDuration: duration ?? const Duration(milliseconds: 300),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
