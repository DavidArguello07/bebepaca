import 'package:flutter/material.dart';
import 'package:bebepaca/auth/bloc/auth_bloc.dart';
import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Exit extends StatefulWidget {
  const Exit({Key? key}) : super(key: key);

  @override
  _ExitState createState() => _ExitState();
}

class _ExitState extends State<Exit> {
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: const Alignment(0.9, -0.9),
        child: IconButton(
            onPressed: () {
              authBloc.logout();
            },
            color: AppColors.red,
            icon: Icon(
              Icons.logout,
              color: AppColors.white,
            )));
  }
}
