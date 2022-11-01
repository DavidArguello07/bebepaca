// ignore_for_file: use_build_context_synchronously

import 'package:bebepaca/auth/bloc/auth_bloc.dart';
import 'package:bebepaca/auth/ui/screens/register.dart';
import 'package:bebepaca/layout/bloc/layout_bloc.dart';
import 'package:bebepaca/layout/ui/screens/layout.dart';
import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:bebepaca/routes/fade_transition_route.dart';
import 'package:bebepaca/shared/widgets/large_button.dart';
import 'package:bebepaca/shared/widgets/loading.dart';
import 'package:bebepaca/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthBloc authBloc;
  late LayoutBloc layoutBloc;
  bool visiblePassword = false;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    layoutBloc = context.read<LayoutBloc>();
    layoutBloc.setLoading(false);
    super.initState();
  }

  @override
  void dispose() {
    print('object');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 85),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ReactiveForm(
                formGroup: authBloc.loginForm,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/bebepaca.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Inicia Sesión',
                        style: GoogleFonts.poppins(
                          color: AppColors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildFieldEmail(),
                    const SizedBox(
                      height: 15,
                    ),
                    _buildFieldPassword(),
                    const SizedBox(
                      height: 15,
                    ),
                    _buildSignUpText(),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildLoginButton()
                  ],
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<LayoutBloc, LayoutState>(
          builder: (context, state) {
            return state.loading ? const Loading() : Container();
          },
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return StreamBuilder(
        stream: authBloc.loginForm.valueChanges,
        builder: (context, snapshot) {
          return Center(
            child: LargeButton(
              text: 'Iniciar Sesión',
              bottom: 25,
              isDisabled: (!authBloc.loginForm.valid),
              onTap: () async {
                if (authBloc.loginForm.valid) {
                  try {
                    layoutBloc.setLoading(true);
                    String email = authBloc.loginForm.control('email').value;
                    String password = authBloc.loginForm.control('password').value;

                    String response = await authBloc.loginWithEmail(email, password);

                    if (response == '200') {
                      authBloc.resetLoginForm();
                      Navigator.of(context)
                          .pushAndRemoveUntil(FadeTransitionRoute(page: const Layout()), (route) => false);
                    } else {
                      showQuickAlert(
                        context,
                        QuickAlertType.error,
                        '¡Error al registrarse!',
                        response,
                      );
                    }

                    layoutBloc.setLoading(false);
                  } catch (e) {
                    layoutBloc.setLoading(false);
                    showQuickAlert(
                      context,
                      QuickAlertType.error,
                      '¡Error al iniciar sesión!',
                      'Intentalo nuevamente',
                    );
                  }
                }
              },
            ),
          );
        });
  }

  Widget _buildFieldEmail() {
    return ReactiveTextField(
      formControlName: 'email',
      validationMessages: {
        'required': (error) => 'El campo es requerido',
        'email': (error) => 'Ingresa un correo valido',
      },
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.cyan,
      style: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 15,
      ),
      decoration: customInputDecoration('Email'),
    );
  }

  Widget _buildFieldPassword() {
    return ReactiveTextField(
      formControlName: 'password',
      validationMessages: {
        'required': (error) => 'El campo es requerido',
        'minLength': (error) => 'La contraseña debe tener mas de seis carácteres',
      },
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.cyan,
      style: GoogleFonts.poppins(
        color: AppColors.blue,
        fontSize: 15,
      ),
      decoration: decorationPassword(),
      obscureText: !visiblePassword,
    );
  }

  Widget _buildSignUpText() {
    return GestureDetector(
      onTap: () => Navigator.push(context, FadeTransitionRoute(page: const Register())),
      child: RichText(
          text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
              children: [
            TextSpan(text: 'No tienes una cuenta? ', style: GoogleFonts.poppins(color: AppColors.blue)),
            TextSpan(
                text: 'Registrate', style: GoogleFonts.poppins(color: AppColors.black, fontWeight: FontWeight.bold)),
          ])),
    );
  }

  InputDecoration decorationPassword() {
    return InputDecoration(
        hintText: 'Contraseña',
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.blue), borderRadius: BorderRadius.circular(7)),
        hintStyle: TextStyle(color: AppColors.blue, height: 1, fontWeight: FontWeight.w400),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.blue), borderRadius: BorderRadius.circular(7)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 1.5), borderRadius: BorderRadius.circular(7)),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.red), borderRadius: BorderRadius.circular(7)),
        fillColor: Colors.white.withOpacity(0.4),
        suffixIcon: IconButton(
          color: AppColors.blue,
          focusColor: AppColors.blue,
          disabledColor: AppColors.blue,
          onPressed: () {
            setState(() {
              visiblePassword = !visiblePassword;
            });
          },
          splashColor: Colors.transparent,
          icon: Icon(
            (!visiblePassword) ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
        ));
  }
}
