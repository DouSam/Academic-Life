import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lunah/enviar.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';

class Resultado extends StatefulWidget {
  const Resultado({ Key? key }) : super(key: key);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  @override
  Widget build(BuildContext context) {

    var argumentos = ModalRoute.of(context)!.settings.arguments as arg;
    
    var resul = argumentos.resultado;

    inspect(resul);

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                "lib/images/tomografia_example.png",
                width: MediaQuery.of(context).size.width * 0.80,
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            Divider(
              height: 10,
              color: Colors.green,
              thickness: 1,
            ),
            Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Paciente: " + resul.paciente + "\n",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: "Solicitante: " + resul.medico + "\n",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: "Data de Nascimento: " + resul.dtNas + "\n",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: "Carteirinha: " + resul.carteirinha + "\n",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: "Data de Envio: " + resul.dtEnvio + "\n",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: "Laudo: " + resul.laudo + "\n",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName("menu"));
                  },
                  child: Text("Menu"), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.45,50),
                  )
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, "laudar", arguments: argumentos);
                  },
                  child: Text("Editar Laudo"), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.45,50)
                  )
                ),                
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      drawer: hamburguer(user.actualUser,context),
    );
  }
}