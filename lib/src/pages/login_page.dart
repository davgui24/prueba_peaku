import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_peaku/src/blocs/bloc_login.dart';
import 'package:prueba_peaku/src/utils/responsive.dart';

class LoginPage extends StatefulWidget {
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controladorEmail = TextEditingController();

  TextEditingController controladorPassword = TextEditingController();

   bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Responsive responsive = Responsive.of(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
            body: Container(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loginForm(responsive, context, height, width)
                  ],
                ),
              ),
            ),
    );
  }

  Widget _loginForm(Responsive responsive, BuildContext context, double height, double width) {

    return Column(
      children: <Widget>[
         SizedBox(height: responsive.ip(30)),
        _crearEmail(responsive),
        SizedBox(height: responsive.ip(5)),
        _crearPassword(responsive, height, width),
        SizedBox(height: responsive.ip(20)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _crearBotonLogin(responsive, height, width),
            SizedBox(height: responsive.ip(3)),
            _irARegistro(responsive)
          ],
        )
      ],
    );
  }

    Widget _crearEmail(Responsive responsive) {
    return StreamBuilder(
        stream: blocLogin.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.08,
            margin: EdgeInsets.symmetric(
                horizontal: responsive.ip(5)),
            child: TextField(
                style: TextStyle(
                    fontSize: responsive.ip(2),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                controller: controladorEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Iniciar sesión',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(173, 181, 189, 1),
                    fontSize: responsive.ip(2),
                    fontWeight: FontWeight.w500,
                  ),
                  errorText: (snapshot.error == null) ? null : snapshot.error.toString(), 
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(173, 181, 189, 1)),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(18.0),
                    ),
                  ),
                ),
                onChanged: (value) => {blocLogin.changeEmail(value)}),
          );
        });
  }

    Widget _crearPassword(Responsive responsive, double height, double width) {
    return StreamBuilder(
        stream: blocLogin.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.08,
            margin: EdgeInsets.symmetric(
                horizontal: responsive.ip(5)),
            child: TextField(
              cursorHeight: 20,
                style: TextStyle(
                    fontSize: responsive.ip(2),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                obscureText: obscureText,
                decoration: InputDecoration(

                  suffixIcon: CupertinoButton(
                      child: Icon(Icons.visibility,
                          color: Color.fromRGBO(230, 230, 230, 1)),
                      onPressed: () {
                        setState(() {
                          (obscureText == false)
                              ? obscureText = true
                              : obscureText = false;
                        });
                      }),
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(173, 181, 189, 1),
                    fontSize: responsive.ip(2),
                    fontWeight: FontWeight.w500,
                  ),
                  errorText: (snapshot.error == null) ? null : snapshot.error.toString(), 
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(173, 181, 189, 1)),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(18.0),
                    ),
                  ),
                ),
                onChanged: (value) => {
                      blocLogin.changePassword(value),
                    }),
          );
        });
  }

    Widget _crearBotonLogin(Responsive responsive, double height, double width) {
    return Container(
      height: height * 0.08,
      margin: EdgeInsets.symmetric(
          horizontal: responsive.ip(5)),
      child: StreamBuilder(
          stream: blocLogin.formValidarEmailPassworStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return RaisedButton(
              onPressed: snapshot.hasData ? () => _login(context) : null,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Iniciar sesión',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 206, 6, 1),
                          fontSize: responsive.ip(2),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black, width: 0.5)),
              // elevation: 5.0,
              color: Color.fromRGBO(33, 36, 41, 1.0),
              textColor: Colors.white,
            );
          }),
    );
  }

     Widget _irARegistro(Responsive responsive){
      return Container(
         margin: EdgeInsets.symmetric(horizontal: responsive.ip(5)),
        child: Text(
                  'Ir a registro',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: responsive.ip(2),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                )
      );
  }

    _login(BuildContext context) async {

    // preference.obtenerPreferencias();
    // showDialog(context: context, barrierColor: Colors.transparent, barrierDismissible: false, builder: (BuildContext context){return loading(context);});

    // loginMaando(blocLogin.email as String, blocLogin.password as String).then((value) {
    //   if (value.runtimeType == FirebaseAuthException) {
    //     print('>>>>>>>>>>>> ERRROR ${value}');
    //     Navigator.pop(context);
    //     showDialog(context: context, barrierColor: Colors.transparent, barrierDismissible: true, builder: (BuildContext context){return loadingError(context, value.message);});
    //     return;
    //   } else {
    //     final user = value["user"];
    //     // print('>>>>>>>>>>>> ERRROR ${user.token}');
    //     user.getIdToken().then((token) {
    //       FirebaseMessaging.instance.getToken().then((fbToken) {
    //         _http
    //             .loginForm(
    //                 email: controladorEmail.text.toLowerCase().trim(),
    //                 password: controladorPassword.text.trim())
    //             .then((value) {
    //           final valueMap = json.decode(value);

    //           print('RESPUESTA DE LOGIN ${valueMap}');

    //           if (valueMap['ok'] == true) {
    //              preference.prefsInternal.setString('urlAvatar', valueMap['usuario']["avatar"]); 
    //             Navigator.pop(context);
    //             preference.prefsInternal
    //                 .setString(
    //                     'expire', fechaExpiracionMenos5Minutos.toString())
    //                 .then((_) => {});

    //             preference.guardarToken(token);
    //             preference.saveSesion(
    //                 email: user.email,
    //                 langCode: Platform.localeName.substring(0, 2),
    //                 expire: fechaExpiracionMenos5Minutos.toString(),
    //                 lastActivity: fechaExpiracionMenos5Minutos.toString(),
    //                 fullName: valueMap['usuario']["name"],
    //                 country: valueMap["usuario"]["country"],
    //                 city: valueMap["usuario"]["city"],
    //                 phone: valueMap['usuario']["phone"],
    //                 provider: 'form');
    //             // Navigator.pop(context);
    //             controladorEmail.text = '';
    //             controladorPassword.text = '';
    //             Navigator.pushReplacementNamed(context, 'onboarding');
    //             // -----------------------

    //           } else if (valueMap['code'] == 401) {
    //             showDialog(context: context, barrierColor: Colors.transparent, barrierDismissible: true, builder: (BuildContext context){ return loadingError(context, valueMap['message']); });
    //           } else if (valueMap['code'] == 404) {
    //             showDialog(context: context, barrierColor: Colors.transparent, barrierDismissible: true, builder: (BuildContext context){ return loadingError(context, valueMap['message']); });
    //           } else {
    //             showDialog(context: context, barrierColor: Colors.transparent, barrierDismissible: true, builder: (BuildContext context){ return loadingError(context, valueMap['message']); });
    //           }
    //         });
    //       });
    //     });
    //   }
    // });
  }

}