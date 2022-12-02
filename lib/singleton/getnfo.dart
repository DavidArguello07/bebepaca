import 'package:flutter/cupertino.dart';

/// Singleton para mantiene los datos de la configuracion de la APP.
class InfoUser {
  /// Factory del singleton
  factory InfoUser() {
    return _instance;
  }
  InfoUser._internal() {
    _uid = '';
  }

  static final InfoUser _instance = InfoUser._internal();

  late String _uid;

  /// Devuelve la MacAddres del dispositivo
  String get getUID {
    return _uid;
  }

  /// Determina si esta configurada en un ambiente de produccion o no.
  // ignore: avoid_positional_boolean_parameters
  Set<void> setUID(String uid) => {
        _uid = uid,
        debugPrint('Obtengo el UID: $_uid'),
      };
}
