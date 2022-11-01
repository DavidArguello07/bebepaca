abstract class HandlerAuthErrors {
  final String error;

  HandlerAuthErrors({required this.error});

  static String getError(String error) {
    String response = '';
    switch (error) {
      case ('account-exists-with-different-credential'):
        response = 'La cuenta ya existe.';
        break;
      case ('invalid-credential'):
        response = 'La cuenta invalida.';
        break;
      case ('weak-password'):
        response = 'La contraseña que ingresaste no es segura.';
        break;
      case ('email-already-in-use'):
        response = 'Ya existe una cuenta con el email que agregaste.';
        break;
      case ('invalid-email'):
        response = 'El email que ingresaste es inválido.';
        break;
      case ('user-disabled'):
        response = 'Tu cuenta esta deshabilitada.';
        break;
      case ('user-not-found'):
        response = 'El usuario con dicho correo no fue encontrado.';
        break;
      case ('wrong-password'):
        response = 'La contraseña que ingresaste es incorrecta.';
        break;
      case ('requires-recent-login'):
        response = 'Necesitas cerrar sesión y volver a iniciar sesión para actualizar tu contraseña.';
        break;
      default:
        response = 'Ocurrio un error.';
    }

    return response;
  }
}
