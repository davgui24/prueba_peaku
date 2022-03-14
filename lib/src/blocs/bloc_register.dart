import 'dart:async';
import 'dart:io';
import 'package:prueba_peaku/src/utils/validaciones/login_validation.dart';
import 'package:rxdart/rxdart.dart';


class RegisterBloc with LoginValidation {
  var _usuarioController = BehaviorSubject<String>();
  var _emailController = BehaviorSubject<String>();
  var _passwordController = BehaviorSubject<String>();
  var _confirmarPasswordController = BehaviorSubject<String>();
  var _nombresController = BehaviorSubject<String>();
  var _apellidosController = BehaviorSubject<String>();
  var _avatarController = BehaviorSubject<String>();
   var _avatarFileController = BehaviorSubject<File>();

  //  RECUPERAR LOS DAOS DEL STREAM
  Stream<String> get usuarioStream =>
      _usuarioController.stream.transform(validarPassword);
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<String> get confirmarPasswordStream => _confirmarPasswordController.stream.transform(validarPassword);
  Stream<String> get nombresStream => _nombresController.stream;
  Stream<String> get apellidosStream => _apellidosController.stream;
  Stream<String> get avatarStream => _avatarController.stream;
  Stream<File> get avatarFileStream => _avatarFileController.stream;

  Stream<bool> get formValidarEmailPassworAndConfirmPasswordStream => CombineLatestStream.combine3(emailStream, passwordStream, confirmarPasswordStream, (e, p, c) => true);
  Stream<bool> get formValidarEmailPassworStream => CombineLatestStream.combine3(usuarioStream, emailStream, passwordStream, (u, e, p) => true);

  //  INSERTAR VALORES AL STREAM
  Function(String) get changeUsuario => _usuarioController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeCofirmarPassword => _confirmarPasswordController.sink.add;
  Function(String) get changeNombres => _nombresController.sink.add;
  Function(String) get changeApellidos => _apellidosController.sink.add;
  Function(String) get changeAvatar => _avatarController.sink.add;
  Function(File) get changeFileAvatar => _avatarFileController.sink.add;

  // OBTENER LOS VALORES DE EL EMAIL Y PASSWORD
  String? get usuario => _usuarioController.value;
  String? get email => _emailController.value;
  String? get password => _passwordController.value;
  String? get confirmarpassword => _confirmarPasswordController.value;
  String? get nombres => _nombresController.value;
  String? get apellidos => _apellidosController.value;
  String? get avatar => _avatarController.value;
  File? get avatarFile => _avatarFileController.value;

  bool get emailStreamHasValue => _emailController.stream.hasValue;
  bool get nombresStreamHasValue => _nombresController.stream.hasValue;
  bool get apellidosStreamHasValue => _apellidosController.stream.hasValue;
  bool get avatarStreamHasValue => _avatarController.stream.hasValue;
  bool get avatarFileStreamHasValue => _avatarFileController.stream.hasValue;

  dispose() {
    _usuarioController.close();
    _emailController.close();
    _passwordController.close();
    _confirmarPasswordController.close();
    _nombresController.close();
    _apellidosController.close();
    _avatarController.close();
    _avatarFileController.close();
  }

  streamNull() {
    _usuarioController = BehaviorSubject<String>();
    _emailController = BehaviorSubject<String>();
    _passwordController = BehaviorSubject<String>();
    _confirmarPasswordController = BehaviorSubject<String>();
    _nombresController = BehaviorSubject<String>();
    _apellidosController = BehaviorSubject<String>();
    _avatarController = BehaviorSubject<String>();
    _avatarFileController = BehaviorSubject<File>();
  }
}

RegisterBloc blocRegister = RegisterBloc();
