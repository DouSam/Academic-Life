
import 'package:flutter/material.dart';
import 'package:lunah/enviar.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';

class Protocolo extends StatefulWidget {
  const Protocolo({ Key? key }) : super(key: key);

  @override
  _ProtocoloState createState() => _ProtocoloState();
}

class _ProtocoloState extends State<Protocolo> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as arg;
    var id = args.id;
    var resultado = args.resultado;

    return Scaffold(
      appBar: AppBar(
        title: Text("Protocolo"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Protocolo " + id ,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Paciente: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: resultado.paciente,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          )
                        )
                      ]
                    ),
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Data de Nascimento: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: resultado.dtNas,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          )
                        )
                      ]
                    ),
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Convenio: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: resultado.carteirinha,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          )
                        )
                      ]
                    ),
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Previsão: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: resultado.dtPrevi,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          )
                        )
                      ]
                    ),
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:RichText(
                    text: TextSpan(
                      text: "Acesso: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: id,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red
                          )
                        )
                      ]
                    ),
                  )
                )
              ],
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.popUntil(context, ModalRoute.withName("menu"));
                },
                child: Text("Menu"), 
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.red.shade300;
                        return Colors.red.shade300;
                      },
                    ),
                  ),
              ),
              width: MediaQuery.of(context).size.width *0.60,
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
