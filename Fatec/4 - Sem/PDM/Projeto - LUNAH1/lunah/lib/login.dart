import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isChecked = false;
  var formKey = GlobalKey<FormState>();

  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Form(
          child: Column(
            children: [
              Image.asset('lib/images/logo.png',
                width: MediaQuery.of(context).size.width *0.60,
              ),
              //Text("LUNAH", style: Theme.of(context).textTheme.headline1,),
              campo("E-mail", txtEmail, TextInputType.emailAddress, "example@example.com",Icon(Icons.email_outlined),false, context),
              campo("Senha", txtSenha, TextInputType.visiblePassword, "p@Ssw0rd",Icon(Icons.password_rounded),true, context),
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
                      },
                    ),
                    padding: EdgeInsets.only(left: 50, bottom: 10, top: 10),
                  ),
                  Text(
                    "Acessar automaticamente.",
                    style: Theme.of(context).textTheme.subtitle1,  
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    login(txtEmail.text, txtSenha.text);
                  },
                  child: Text("Acessar"), 
                ),
                width: MediaQuery.of(context).size.width *0.60,
                height: 50,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "registrar");
                  },
                  child: Text("Registrar-se"), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade400
                  ),
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
        backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("LUNAH"),
        centerTitle: true,
      ),
    );
  }

  void login(email, senha) {

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha).then((value) async{

      var userQuery = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
      var userDocument = userQuery.docs.first.data();

      user.actualUser = user.User(
        userDocument['email'],
        "",
        userDocument['nome'],
        userDocument['cpf'],
        userDocument['dtNas'],
        userDocument['crm'],
        userDocument['tipUsr'],
        userDocument['carteirinha'],
        userQuery.docs[0].id
      );

      Navigator.pushReplacementNamed(context, "menu");

    }).catchError((erro){

      var mensagem = '';
      if (erro.code == 'user-not-found'){
        mensagem = 'ERRO: Usuário não encontrado';
      }else if (erro.code == 'wrong-password'){
        mensagem = 'ERRO: Usuário ou senha inválida.';
      }else if ( erro.code == 'invalid-email'){
        mensagem = 'ERRO: Email inválido';
      }else{
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensagem),
            duration: const Duration(seconds:2)
          )
      );

    });
  }
}

