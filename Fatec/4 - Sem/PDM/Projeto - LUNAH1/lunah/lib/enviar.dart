import 'package:flutter/material.dart';
import 'package:lunah/user.dart' as user;
import 'package:lunah/exame.dart' as exame;

class Enviar extends StatefulWidget {
  const Enviar({ Key? key }) : super(key: key);

  @override
  _EnviarState createState() => _EnviarState();
}

class _EnviarState extends State<Enviar> {
  
  var formKey  = GlobalKey<FormState>();
  var ctrlNome = TextEditingController();
  var ctrlDtN  = TextEditingController();
  var ctrlNumC = TextEditingController();
  var ctrlImg  = TextEditingController();
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
            campo("Nome do Paciente", ctrlNome, TextInputType.name, "Nome Exemplo", Icon(Icons.person_outlined), false),
            campo("Data de Nascimento", ctrlDtN, TextInputType.datetime, "07/01/2021", Icon(Icons.calendar_today), false),
            campo("Numero Carteirinha", ctrlNumC, TextInputType.number, "4376497538249728349", Icon(Icons.credit_card), false),
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
                  style: TextStyle(
                    color: Colors.red
                  ),
                )
              ],
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  var exm = exame.Exame(ctrlNome.text,ctrlDtN.text,ctrlNumC.text);
                  Navigator.pushNamed(context, "protocolo", arguments: exm);
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Resultado'),
                        content: Text("Exame enviado, anote o protocolo da apresentado."),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child: Text('fechar'),
                          ),
                        ],
                      );
                    }
                  );
                },
                child: Text("Enviar"), 
              ),
              width: MediaQuery.of(context).size.width *0.60,
              height: 50,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
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

  Widget campo(rotulo, fieldControler, fieldType, fieldHint, fieldIcon,fieldObs){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: TextFormField(
        keyboardType: fieldType,
        controller: fieldControler,
        style: Theme.of(context).textTheme.headline1,
        obscureText: fieldObs,
        decoration: InputDecoration(
          icon: fieldIcon,
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline2,
          hintText: fieldHint,
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
            ),
            borderRadius: BorderRadius.circular(10),  
          ),
        ),
      ),
    );
  }
}