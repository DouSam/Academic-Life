import 'package:flutter/material.dart';
import 'package:lunah/user.dart' as user;

class Pesquisa extends StatefulWidget {
  const Pesquisa({ Key? key }) : super(key: key);

  @override
  _PesquisaState createState() => _PesquisaState();
}

enum valRad {Processados,Processar}

class Paciente{
  final String nome;
  final String dtnas;
  final String numc;
  Paciente(this.nome,this.dtnas,this.numc);
}

class _PesquisaState extends State<Pesquisa> {

  var formKey  = GlobalKey<FormState>();
  var ctrlNome = TextEditingController();
  var ctrlDtN  = TextEditingController();
  var ctrlNumC = TextEditingController();
  var ctrlImg  = TextEditingController();

  valRad? _character = valRad.Processados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisa Resultados"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            campo("Nome do Paciente", ctrlNome, TextInputType.name, "Nome Exemplo", Icon(Icons.person_outlined), false),
            campo("Data de Nascimento", ctrlDtN, TextInputType.datetime, "07/01/2021", Icon(Icons.calendar_today), false),
            campo("Numero Carteirinha", ctrlNumC, TextInputType.number, "4376497538249728349", Icon(Icons.credit_card), false),
            Column(
              children: [
                ListTile(
                  title: const Text('Já Processados'),
                  leading: Radio<valRad>(
                    value: valRad.Processados,
                    groupValue: _character,
                    onChanged: (valRad? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('A processar'),
                  leading: Radio(
                    value: valRad.Processar,
                    groupValue: _character,
                    onChanged: (valRad? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  var obj = Paciente(ctrlNome.text,ctrlDtN.text,ctrlNumC.text);
                  Navigator.popUntil(context, ModalRoute.withName("menu"));
                  Navigator.pushNamed(context, 'menu');
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Resultado'),
                        content: Text("Exames filtrados conforme abaixo:\nNome: ${obj.nome}\nDt Nascimento:${obj.dtnas}\nCarteirinha:${obj.numc}"),
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
                child: Text("Pesquisar"), 
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