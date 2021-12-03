import 'package:flutter/material.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';

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
            campo("Nome do Paciente", ctrlNome, TextInputType.name, "Nome Exemplo", Icon(Icons.person_outlined), false,context),
            campo("Data de Nascimento", ctrlDtN, TextInputType.datetime, "07/01/2021", Icon(Icons.calendar_today), false,context),
            campo("Numero Carteirinha", ctrlNumC, TextInputType.number, "4376497538249728349", Icon(Icons.credit_card), false,context),
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
                  Navigator.pushNamed(context, 'menu',arguments: Filter(obj.nome, obj.dtnas, obj.numc));
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
      drawer: hamburguer(user.actualUser, context),
    );
  }

}

class Filter{
  String nome;
  String dtnas;
  String carteirinha;
  Filter(this.nome,this.dtnas,this.carteirinha);
}