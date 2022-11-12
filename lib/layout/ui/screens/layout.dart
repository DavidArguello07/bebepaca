import 'package:bebepaca/auth/bloc/auth_bloc.dart';
import 'package:bebepaca/profile_trips.dart';
import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:bebepaca/routes/auth_router.dart';
import 'package:bebepaca/routes/fade_transition_route.dart';
import 'package:bebepaca/shared/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authBloc.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? user = snapshot.data;

            if (user != null) {
            return SafeArea(
              child: Scaffold(
                  body: SizedBox(
                    child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ProfileTrips(),
                      // Text(
                      //   'Bienvenido ${user.displayName}',
                      //   style: GoogleFonts.poppins(
                      //     color: AppColors.blue,
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      IconButton(
                          onPressed: () {
                            authBloc.logout();
                          },
                          color: AppColors.blue,
                          icon: Icon(Icons.logout, color: AppColors.red,))
                    ],
                ),
              ),
                  )),
            );
            } else {
              goLogin();
              return Container();
            }

          } else if (!snapshot.hasData && snapshot.connectionState == ConnectionState.active) {
            goLogin();
            return const Loading(inScreenWhite: true);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading(inScreenWhite: true);
          } else {
            return Container();
          }
        });
  }

  void goLogin() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(
        context,
      ).pushAndRemoveUntil(FadeTransitionRoute(page: const AuthRouter()), (route) => false);
    });
  }
}
