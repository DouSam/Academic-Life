import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';

class Registrar extends StatefulWidget {
  const Registrar({ Key? key }) : super(key: key);

  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtNome  = TextEditingController();
  var txtCPF   = TextEditingController();
  var txtDtNas = TextEditingController();
  var txtCRM   = TextEditingController();
  var txtCart  = TextEditingController();

  String dropdownValue = 'Paciente';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LUNAH"),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            Text("Complete seu registro",style: Theme.of(context).textTheme.headline1),
            campo("E-mail", txtEmail, TextInputType.emailAddress, "example@example", Icon(Icons.email_outlined), false,context),
            campo("Senha", txtSenha, TextInputType.visiblePassword, "P2ssw0rD", Icon(Icons.password), true,context),
            campo("Nome", txtNome, TextInputType.name, "Nome Completo", Icon(Icons.person), false,context),
            campo("CPF", txtCPF, TextInputType.number, "xxxxxxxxxxx", Icon(Icons.camera_front_rounded), false,context),
            campo("Data de Nascimento", txtDtNas, TextInputType.datetime, "99/99/9999", Icon(Icons.calendar_today_outlined), false,context),
            campo("CRM", txtCRM, TextInputType.text, "514251SP", Icon(Icons.document_scanner), false,context),
            campo("Carteirinha", txtCart, TextInputType.text, "18156181651", Icon(Icons.document_scanner), false,context),
            Row(
              children:[
                Container(
                  child: 
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.supervised_user_circle_outlined),
                      iconSize: 24,
                      elevation: 16,
                      
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20
                        ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Paciente','Medico']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    margin: EdgeInsets.fromLTRB(50, 5, 0, 10),
                )
              ]
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  user.actualUser = user.User(txtEmail.text,txtSenha.text,txtNome.text,txtCPF.text,txtDtNas.text,txtCRM.text,dropdownValue,txtCart.text,"");
                  criarConta();
                },
                child: Text("Finalizar"),
              ),
              width: MediaQuery.of(context).size.width *0.60,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        key: formKey,
      ),
      
    );
  }

  void criarConta() {

    CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: user.actualUser.email,
      password: user.actualUser.senha,
    ).then((value) {

      userCollection.add(user.actualUser.toMap());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário criado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
      user.actualUser.limpar();
      Navigator.pop(context);
    }).catchError((erro) {
      user.actualUser.limpar();
      if (erro.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ERRO: O email informado já está em uso.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ERRO: ${erro.message}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }
}