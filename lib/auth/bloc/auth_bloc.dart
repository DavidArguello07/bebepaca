import 'package:bebepaca/auth/models/admin_user_model.dart';
import 'package:bebepaca/auth/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {}

  Stream<User?> authStateChanges() => authRepository.authStateChanges();
  // FORM

  final FormGroup loginForm = FormGroup({
    'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)])
  });

  final FormGroup registerForm = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
    'confirmPassword': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
  }, validators: [
    Validators.mustMatch('password', 'confirmPassword')
  ]);

  resetLoginForm(){
    loginForm.reset(emitEvent: false);
  }

  resetRegisterForm(){
    registerForm.reset(emitEvent: false);
  }

  Future<String> registerWithEmail(String email, String password, String name) async {
    return authRepository.registerWithEmail(email, password, name);
  }

  Future<String> loginWithEmail(String email, String password) {
    return authRepository.loginWithEmail(email, password);
  }

  Future<void> logout() => authRepository.logout();
}
