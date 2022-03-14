import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

shortString(String text, int length) {
  if (text.length > length) {
    return "${text.substring(0, length)}...";
  } else {
    return text;
  }
}

String extraerUsuario(String email) {
  // extraemos el primer nombre si lo tiene
  if (email.contains('@') == true) {
    return email.split('@')[0];
  } else {
    return email;
  }
}


Widget textExpanded({String text = '', double width = 0, double sizeText = 0, Color color = Colors.black, FontWeight font = FontWeight.bold, TextAlign textAlign = TextAlign.center}){
  return Container(
                   width: width,
                   child: Row(
                   children: [
                     Expanded(
                     child: Text(text,
                     textAlign: (textAlign == null) ? TextAlign.center : textAlign,
                     style: TextStyle(
                               color: (color == null) ? Color.fromRGBO(33, 36, 41, 1.0) : color,
                               fontWeight: (font == null) ? FontWeight.bold : font,
                               fontSize: sizeText)),
                           ),
                         ],
                     ),
                 );
}