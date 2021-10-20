import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Image.network('https://lh3.googleusercontent.com/proxy/F63-irC14-J-SvSfvzlykVQfvbdjy64LqAH6ZeXw1HWOK8tsp0fBKZ1sIuAq5vI_FIxN-nyXJcZRT52wsztaaZ-vdAGryHE3fx4pAN9jCevG8Mm0',
            width: 50,
            height: 50,
          ),
          Text("LUNAH"),
          campoTexto("E-mail", txtEmail, TextInputType.emailAddress, "example@example.com")
        ],
      ),
      key: formKey,
    );
  }

  Widget campoTexto(rotulo, fieldControler, fieldType, fieldHint){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
        keyboardType: fieldType,
        controller: fieldControler,
        style: Theme.of(context).textTheme.headline1,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline2,
          hintText: fieldHint,
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
            ),
            borderRadius: BorderRadius.circular(12),  
          ),
        ),
      ),
    );
  }
}

