import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lunah/models/user.dart';
import 'package:lunah/widgetLib.dart';

import 'enviar.dart';

class Laudar extends StatefulWidget {
  const Laudar({Key? key}) : super(key: key);

  @override
  _LaudarState createState() => _LaudarState();
}

class _LaudarState extends State<Laudar> {
  @override
  Widget build(BuildContext context) {
    var argumentos = ModalRoute.of(context)!.settings.arguments as arg;

    var resul = argumentos.resultado;
    var id = argumentos.id;

    var ctrlLaudo = TextEditingController();

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
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Divider(
                height: 10,
                color: Colors.green,
                thickness: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: textLong("Laudo", ctrlLaudo, TextInputType.multiline,"", Icon(Icons.receipt_long_rounded), false, context, (resul.laudo == ""? "":resul.laudo)),
                  )
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DateTime now = new DateTime.now();
                        String data = now.day.toString() + "/" + now.month.toString() + "/" + now.year.toString();

                        CollectionReference colResultados =
                            FirebaseFirestore.instance.collection('resultados');
                        colResultados.doc(id).update({
                          'laudo': ctrlLaudo.text,
                          'dtLaudo': data
                        }).then((value) {

                          CollectionReference colNotifica = FirebaseFirestore.instance.collection('notificacoes');
                          colNotifica.add({
                            'msg'  : 'Exame ' + id + ' foi laudado.',
                            'data' : DateTime.now()
                          }).then((value) {
                            Navigator.popUntil(
                              context, ModalRoute.withName("menu"));
                          });
                        });
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Laudo'),
                                content: Text("Exame laudado com sucesso."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('fechar'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text("Salvar"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.92, 50),
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      drawer: hamburguer(actualUser, context),
    );
  }
}
