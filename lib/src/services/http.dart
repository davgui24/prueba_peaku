import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prueba_peaku/src/enviroments/url_server.dart';


class HttpV2 extends ChangeNotifier {
  final String _url = urlserver.url;

  final String _url1 =
      'https://gtjrbm1idd.execute-api.us-east-1.amazonaws.com/maando/v1';

  // final preference = new Preferencias();


  // ********* USUARIOS
    Future<dynamic> registerGooglev2(
      {String token = '', String uid = '', String name = '', String email = ''}) async {
    final url = Uri.parse('$_url/registroUsuarioGooglev2');
    final Map<String, dynamic> data = {
      'token': token,
      'uid': uid,
      'name': name,
      'email': email
    };
    try {
      final resp = await http.post(url, body: json.encode(data), headers: {
        'content-type': 'application/json',
        'langcode': Platform.localeName.substring(0, 2),
      });

      final decodedData = Utf8Codec().decode(resp.bodyBytes);
      ;
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }
  }

  Future<dynamic> registerFacebookv2(
      {String tokenFacebook = '',
      String tokenFirebase = '',
      String uid = ''}) async {
    final url = Uri.parse('$_url/registroUsuarioFacebookv2');
    final Map<String, dynamic> data = {
      'tokenFacebook': tokenFacebook,
      'tokenFirebase': tokenFirebase,
      'uid': uid,
    };
    try {
      final resp = await http.post(url, body: json.encode(data), headers: {
        'content-type': 'application/json',
        'langcode': Platform.localeName.substring(0, 2),
      });
      final decodedData = Utf8Codec().decode(resp.bodyBytes);
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }
  }

  // *************************************************************************

  Future<dynamic> registerApplev2(
      {String token = '', String uid = ''}) async {
    final url = Uri.parse('$_url/registroUsuarioApplev2');
    final Map<String, dynamic> data = {
      'token': token,
      'uid': uid,
    };

    try {
      final resp = await http.post(url, body: json.encode(data), headers: {
        'content-type': 'application/json',
        'langcode': Platform.localeName.substring(0, 2),
      });
      final decodedData = Utf8Codec().decode(resp.bodyBytes);
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }
  }

    // *************************************************************************
  Future<dynamic> createAdv2(
      {String emailOwner = '',
      String title = '',
      List<File> images = const [],
      String insurance = '',
      String countryDeparture = '',
      String country = '',
      String cityDeparture = '',
      String city = '',
      String price = '',
      String arrivalDate = '',
      String departureDate = '',
      dynamic delivery,
      }) async {
    final url = Uri.parse('$_url/createAdv3');


    final data = http.MultipartRequest('POST', url);
    for(var i in images){
        final fileImage = await http.MultipartFile.fromPath('images', i.path);
        data.files.add(fileImage);
    }

    // final fileImage = await http.MultipartFile.fromPath('images', images[0].path);
    // data.files.add(fileImage);

    data.fields['emailOwner'] = emailOwner;
    data.fields['title'] = title;
    data.fields['insurance'] = insurance;
    data.fields['cityDeparture'] = cityDeparture;
    data.fields['city'] = city;
    data.fields['countryDeparture'] = countryDeparture;
    data.fields['country'] = country;
    data.fields['price'] = price;
    data.fields['arrivalDate'] = arrivalDate;
    data.fields['departureDate'] = departureDate;
    data.fields['delivery'] = delivery;
    data.headers['Content-Type'] = 'multipart/form-data';

    try {
      final streamRresponse = await data.send();
      final resp = await http.Response.fromStream(streamRresponse);
      final decodedData = Utf8Codec().decode(resp.bodyBytes);
      return decodedData;
    } catch (e) {
      print(e.toString());
      return json.encode({'ok': false, 'message': 'Error of internet!'});
    }


    // try {
    //   final resp = await http.post(url, body: json.encode(data), headers: {
    //     'content-type': 'application/json',
    //     'langcode': Platform.localeName.substring(0, 2),
    //   });

    //   final decodedData = Utf8Codec().decode(resp.bodyBytes);
    //   // if(json.decode(decodedData)["authorized"] == false) return Navigator.pushReplacementNamed(context, 'login');
    //   return decodedData;
    // } catch (e) {
    //   print(e.toString());
    //   return json.encode({'ok': false, 'message': 'Error of internet!'});
    // }
  }

}