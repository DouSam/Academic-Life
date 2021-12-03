

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lunah/models/resultado.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';

class Enviar extends StatefulWidget {
  const Enviar({Key? key}) : super(key: key);

  @override
  _EnviarState createState() => _EnviarState();
}

class _EnviarState extends State<Enviar> {
  var formKey = GlobalKey<FormState>();
  var ctrlNome = TextEditingController();
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enviar Exame"),
        centerTitle: true,
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              campo("Nome do Paciente", ctrlNome, TextInputType.name,
                  "Nome Exemplo", Icon(Icons.person_outlined), false, context),
              Row(
                children: [
                  Container(
                    child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                  ),
                  Text(
                    "PRIORITARIO",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async{
                    var colUsers = await FirebaseFirestore.instance.collection('users').where('nome',isEqualTo: ctrlNome.text).get();
                    var paciente = colUsers.docs;

                    if(paciente.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Paciente não encontrado."),
                          duration: const Duration(seconds:2)
                        )
                      );
                    } else {
                      DateTime now = new DateTime.now();
                      String data = now.day.toString() + "/" + now.month.toString() + "/" + now.year.toString();
                      String dataPrev = (now.day + 1).toString() + "/" + now.month.toString() + "/" + now.year.toString();

                      var resul = Resultado(paciente[0]['nome'],user.actualUser.nome,data,"","",dataPrev,isChecked,paciente[0]['carteirinha'],paciente[0]['dtNas']);

                      FirebaseFirestore.instance.collection('resultados').add(resul.map()).then((value){
                        Navigator.pushNamed(context, "protocolo", arguments: arg(resul, value.id));
                      }).catchError((erro){
                        print(erro);
                      });

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Resultado'),
                              content: Text(
                                  "Exame enviado, anote o protocolo da apresentado."),
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
                    }
                  },
                  child: Text("Enviar"),
                ),
                width: MediaQuery.of(context).size.width * 0.60,
                height: 50,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )),
      drawer: hamburguer(user.actualUser, context),
    );
  }

  
}

// ignore: camel_case_types
class arg {
  Resultado resultado;
  String id;
  arg(this.resultado,this.id);
}