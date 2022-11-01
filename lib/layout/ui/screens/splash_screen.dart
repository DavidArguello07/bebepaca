import 'package:bebepaca/layout/ui/screens/layout.dart';
import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:bebepaca/routes/fade_transition_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteBackground,
      child: Lottie.asset(
        'assets/logo_lottie.json',
        animate: true,
        controller: controller,
        height: MediaQuery.of(context).size.height * 0.1,
        onLoaded: (p0) {
          controller
            ..duration = p0.duration
            ..forward().whenComplete(() {
              Navigator.of(context).pushAndRemoveUntil(FadeTransitionRoute(page: const Layout()), (route) => false);
            });
        },
      ),
    );
  }
}
