import 'package:flutter/material.dart';
import 'package:lunah/acompanhamento.dart';

import 'package:lunah/enviar.dart';
import 'package:lunah/laudar.dart';
import 'package:lunah/login.dart';
import 'package:lunah/menu.dart';
import 'package:lunah/pesquisa.dart';
import 'package:lunah/protocolo.dart';
import 'package:lunah/registrar.dart';
import 'package:lunah/resultado.dart';
import 'package:lunah/sobre.dart';

void main() async{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LUNAH',
      initialRoute: 'login',
      routes: {
        'login'     : (context) => Login(),
        'registrar' : (context) => Registrar(),
        'menu'      : (context) => Menu(),
        'sobre'     : (context) => Sobre(),
        'enviar'    : (context) => Enviar(),
        'protocolo' : (context) => Protocolo(),
        'resultado' : (context) => Resultado(),
        'pesquisa'  : (context) => Pesquisa(),
        'laudar'    : (context) => Laudar(),
        'acomp'     : (context) => Acomapnhamento()
      },
      theme: ThemeData(
        primaryColor: Colors.grey[300],
        backgroundColor: Colors.white,
        focusColor: Colors.grey.shade600,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade900
          ),

          headline2: TextStyle(
            fontSize: 18,
            color: Colors.green.shade900,
          ),

          headline3: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade500,
          ),

          headline4: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),

          subtitle1: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),

        //aparência do botão
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[400],
            textStyle: TextStyle(
              fontSize: 20,
            ),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          ),
        ),
      ),
    ),
  );
}
