import 'dart:async';

class CreateAccountValidation {
  final validarFullName = StreamTransformer<String, String>.fromHandlers(
      handleData: (fullName, sink) {
    if (fullName.trim().length >= 3) {
      sink.add(fullName);
    } else {
      sink.addError(
          'Ingrese un mínimo de 3 caracteres: tiene: ' + fullName.length.toString());
    }
  });

  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(email) || email.length <= 0) {
      sink.add(email);
    } else {
      sink.addError('El correo electrónico no es correcto.');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.trim().length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Ingrese un mínimo de 6 caracteres: tiene: ' +
          password.length.toString());
    }
  });
  final validarPasswordConfirm = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.trim().length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Ingrese un mínimo de 6 caracteres: tiene: ' +
          password.length.toString());
    }
  });

  final validarPhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (isPhone(phone)) {
      sink.add(phone);
    } else {
      sink.addError('Sólo números');
    }
  });

  static bool isPhone(String p) {
    if (p.isEmpty) return false;
    final n = num.tryParse(p);

    return (n == null) ? false : true;
  }

    // ---------------------------------------
  final validarCountryCity =
      StreamTransformer<String, String>.fromHandlers(handleData: (countryCity, sink) {
    if (countryCity.trim().length >= 3) {
      sink.add(countryCity);
    } else {
      sink.addError(
          'Enter minimum 6 characters: takes: ' + countryCity.length.toString());
    }
  });
}