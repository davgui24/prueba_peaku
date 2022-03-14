

import 'package:prueba_peaku/src/utils/validaciones/login_validation.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with LoginValidation {

  var _emailController = BehaviorSubject<String>();
  var _passwordController = BehaviorSubject<String>();


  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<bool> get formValidarEmailPassworStream => CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  String? get email => _emailController.value;
  String? get password => _passwordController.value;


  dispose() {
    _emailController.close();
    _passwordController.close();
  }


  streamNull() {
   _emailController = BehaviorSubject<String>();
  _passwordController = BehaviorSubject<String>();
  }

}

LoginBloc blocLogin = LoginBloc();