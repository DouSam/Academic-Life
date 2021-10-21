import 'package:flutter/material.dart';
import 'package:lunah/exame.dart';
import 'package:lunah/user.dart' as user;

class Protocolo extends StatefulWidget {
  const Protocolo({ Key? key }) : super(key: key);

  @override
  _ProtocoloState createState() => _ProtocoloState();
}

class _ProtocoloState extends State<Protocolo> {
  @override
  Widget build(BuildContext context) {

    var exm = ModalRoute.of(context)!.settings.arguments as Exame;
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
                Text("Protocolo 194812",
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
                          text: exm.nome,
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
                          text: exm.dataNascimento,
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
                          text: exm.numeroCarterinha,
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
                          text: "24/10/2021",
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
                          text: "x8qs4fq9a2h",
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
      drawer: Hamburguer(user.actualUser),
    );
  }

  Widget Hamburguer(usr){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: 
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          size: 48,
                        ),
                        Text(
                          "Douglas",
                          style: Theme.of(context).textTheme.headline2,
                        ), //Ira ficar o nome do usuário, momentaneamente apenas "DOUGLAS"
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          usr.email,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[500],
                          )
                        )
                      ],
                    )
                  ],
                ),
            ),
            ListTile(
              title: Text(
                "Ultimas Analises",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'menu');
              },
            ),
            ListTile(
              title: Text(
                "Enviar Exame",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'enviar');
              },
            ),
            ListTile(
              title: Text(
                "Resultados",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'pesquisa');
              },
            ),
            ListTile(
              title: Text(
                "Acompanhamento",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'acompanhamento');
              },
            ),
            ListTile(
              title: Text(
                "Sobre",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'sobre');
              },
            ),
          ],
        ),
    );
  }
}