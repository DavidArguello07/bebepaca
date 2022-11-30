import 'package:bebepaca/auth/bloc/auth_bloc.dart';
import 'package:bebepaca/auth/repository/auth_repository.dart';
import 'package:bebepaca/firebase_options.dart';
import 'package:bebepaca/layout/bloc/layout_bloc.dart';
import 'package:bebepaca/routes/splash_router.dart';
import 'package:bebepaca/z-project/Components/add_form.dart';
import 'package:bebepaca/z-project/Components/info_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(authRepository: AuthRepository())),
        BlocProvider(create: (context) => LayoutBloc())
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [HeroController()],
        home: const SlashRouter(),
        // home: LoginForm(),
        // home: const InfoPage(),
      ),
    );
  }
}
