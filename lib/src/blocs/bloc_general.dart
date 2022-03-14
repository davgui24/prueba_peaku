// import 'dart:async';
// import 'package:rxdart/rxdart.dart';
// import 'package:location/location.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GeneralBloc {
//   var _allUsersController = BehaviorSubject<List<dynamic>>();
//   var _userController = BehaviorSubject<dynamic>();
//   var _locationController = BehaviorSubject<LocationData>();
//   var _locationMapController = BehaviorSubject<LatLng>();
//   var _startController = BehaviorSubject<int>();
//   var _cotegoriasSearchController = BehaviorSubject<String>();
//   var _deportesSearchController = BehaviorSubject<String>();
//   var _chatController = BehaviorSubject<String>();
//   var _openModalController = BehaviorSubject<bool>();
//   var _intexTapController =
//       BehaviorSubject<int>(); // posicion del navigation bar
//   var _validarNotificacionController = BehaviorSubject<bool>();
//   var _emailNotificacionController = BehaviorSubject<String>();

//   //  INSERTAR VALORES AL STREAM
//   Function(List<dynamic>) get changeAllUsers => _allUsersController.sink.add;
//   Function(dynamic) get changeUser => _userController.sink.add;
//   Function(LocationData) get changeLocation => _locationController.sink.add;
//   Function(LatLng) get changeLocationMap => _locationMapController.sink.add;
//   Function(int) get changeStart => _startController.sink.add;
//   Function(String) get changeCategoriaSearch =>
//       _cotegoriasSearchController.sink.add;
//   Function(String) get changeDeportesSearch =>
//       _deportesSearchController.sink.add;
//   Function(String) get changeChat => _chatController.sink.add;
//   Function(bool) get changeOpenModal => _openModalController.sink.add;
//   Function(int) get changeIndexTap => _intexTapController.sink.add;

//   Function(bool) get changeValidarNotificacion =>
//       _validarNotificacionController.sink.add;
//   Function(String) get changeEmailNotificacion =>
//       _emailNotificacionController.sink.add;

//   // OBTENER LOS VALORES
//   List<dynamic>? get allUsers => _allUsersController.value;
//   dynamic get user => _userController.value;
//   LocationData? get location => _locationController.value;
//   LatLng? get locationMap => _locationMapController.value;
//   int? get start => _startController.value;
//   String? get categoriaSearch => _cotegoriasSearchController.value;
//   String? get deportesSearch => _deportesSearchController.value;
//   String? get chat => _chatController.value;
//   bool? get openModal => _openModalController.value;
//   int? get indexTap => _intexTapController.value;

//   bool get validarNotificacion => _validarNotificacionController.hasValue;
//   String? get emailNotificacion => _emailNotificacionController.value;

//   // HasValue
//   bool get allUsersStreamHasValue => _allUsersController.hasValue;
//   bool get indexTapStreamHasValue => _intexTapController.hasValue;
//   bool get locationStreamHasValue => _locationController.hasValue;
//   bool get userStreamHasValue => _userController.stream.hasValue;
//   bool get locationMapStreamHasValue => _locationMapController.stream.hasValue;

// // STREAM
//   Stream<List<dynamic>> get allUsersStream => _allUsersController.stream;
//   Stream<dynamic> get userStream => _userController.stream;
//   Stream<LocationData> get locationStream => _locationController.stream;
//   Stream<LatLng> get locationMApStream => _locationMapController.stream;
//   Stream<int> get startStream => _startController.stream;
//   Stream<String> get categoriaSearchStream =>
//       _cotegoriasSearchController.stream;
//   Stream<String> get deportesSearchStream => _deportesSearchController.stream;
//   Stream<String> get chatStream => _chatController.stream;
//   Stream<bool> get openModalStream => _openModalController.stream;
//   Stream<int> get indexTapStream => _intexTapController.stream;

//   Stream<bool> get validarNotificacionStream =>
//       _validarNotificacionController.stream;
//   Stream<String> get emailNotificacionStream =>
//       _emailNotificacionController.stream;

//   dispose() {
//     _userController.close();
//     _locationController.close();
//     _locationMapController.close();
//     _startController.close();
//     _cotegoriasSearchController.close();
//     _deportesSearchController.close();
//     _chatController.close();
//     _openModalController.close();
//     _intexTapController.close();
//     _validarNotificacionController.close();
//     _emailNotificacionController.close();
//   }

//   disposeAllUsers() {
//     _allUsersController.close();
//   }

//   // disposeNotification() {
//   //   _validarNotificacionController.close();
//   // }

//   streamNullNotificaciones() {
//     _validarNotificacionController = BehaviorSubject<bool>();
//   }

//   allUserstreamNull() {
//     _allUsersController = BehaviorSubject<List<dynamic>>();
//   }

//   streamNull() {
//     _userController = BehaviorSubject<dynamic>();
//     _locationController = BehaviorSubject<LocationData>();
//     _locationMapController = BehaviorSubject<LatLng>();
//     _startController = BehaviorSubject<int>();
//     _cotegoriasSearchController = BehaviorSubject<String>();
//     _deportesSearchController = BehaviorSubject<String>();
//     _chatController = BehaviorSubject<String>();

//     _openModalController = BehaviorSubject<bool>();
//     _intexTapController = BehaviorSubject<int>();
//     // _validarNotificacionController = BehaviorSubject<bool>();
//     // _emailNotificacionController = BehaviorSubject<String>();
//   }
// }

// GeneralBloc blocGeneral = GeneralBloc();
