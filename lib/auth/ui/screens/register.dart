// ignore_for_file: use_build_context_synchronously

import 'package:bebepaca/auth/bloc/auth_bloc.dart';
import 'package:bebepaca/layout/bloc/layout_bloc.dart';
import 'package:bebepaca/layout/ui/screens/layout.dart';
import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:bebepaca/routes/fade_transition_route.dart';
import 'package:bebepaca/shared/widgets/back_button.dart';
import 'package:bebepaca/shared/widgets/large_button.dart';
import 'package:bebepaca/shared/widgets/loading.dart';
import 'package:bebepaca/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.whiteBackground,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  AppBarBackButton(
                    isModal: false,
                  )
                ],
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ReactiveForm(
                formGroup: authBloc.registerForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Registro',
                        style: GoogleFonts.poppins(
                          color: AppColors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildFieldName(),
                    const SizedBox(
                      height: 15,
                    ),
                    _buildFieldEmail(),
                    const SizedBox(
                      height: 15,
                    ),
                    _buildFieldPassword(),
                    const SizedBox(
                      height: 15,
                    ),
                    _buildFieldConfirmPassword(),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildRegisterButton()
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

  Widget _buildRegisterButton() {
    return StreamBuilder(
        stream: authBloc.registerForm.valueChanges,
        builder: (context, snapshot) {
          return Center(
            child: LargeButton(
              text: 'Registrarme',
              bottom: 25,
              isDisabled: (!authBloc.registerForm.valid),
              onTap: () async {
                if (authBloc.registerForm.valid) {
                  try {
                    layoutBloc.setLoading(true);
                    String name = authBloc.registerForm.control('name').value;
                    String email = authBloc.registerForm.control('email').value;
                    String password = authBloc.registerForm.control('password').value;

                    String response = await authBloc.registerWithEmail(email, password, name);

                    if (response == '200') {
                      authBloc.registerForm.reset();
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
                      '¡Error al registrarse!',
                      'Intentalo nuevamente',
                    );
                  }
                }
              },
            ),
          );
        });
  }

  Widget _buildFieldName() {
    return ReactiveTextField(
      formControlName: 'name',
      validationMessages: {
        'required': (error) => 'El campo es requerido',
      },
      onSubmitted: (control) => authBloc.registerForm.focus('name'),
      maxLines: 1,
      keyboardType: TextInputType.name,
      cursorColor: AppColors.blue,
      style: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 15,
      ),
      decoration: customInputDecoration('Nombre Completo'),
    );
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
      cursorColor: AppColors.blue,
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
      cursorColor: AppColors.blue,
      style: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 15,
      ),
      decoration: decorationPassword('Confirmar'),
      obscureText: !visiblePassword,
    );
  }

  Widget _buildFieldConfirmPassword() {
    return ReactiveTextField(
      formControlName: 'confirmPassword',
      validationMessages: {
        'required': (error) => 'El campo es requerido',
        'minLength': (error) => 'La contraseña debe tener mas de seis carácteres',
        'mustMatch': (error) => 'La contraseña no coincide con la anterior ingresada',
      },
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.blue,
      style: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 15,
      ),
      decoration: decorationPassword('Confirmar contraseña'),
      obscureText: !visiblePassword,
    );
  }

  InputDecoration decorationPassword(String hintText) {
    return InputDecoration(
        hintText: hintText,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.blue), borderRadius: BorderRadius.circular(7)),
        hintStyle: TextStyle(color: AppColors.black, height: 1, fontWeight: FontWeight.w400),
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
