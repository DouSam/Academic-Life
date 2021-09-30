import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "IMC",
      home: TelaPrincipal(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.green[400],
        backgroundColor: Colors.grey[300],
        textTheme: TextTheme(

          headline1: TextStyle(
            fontSize: 24,
            color: Colors.lightBlue[600]
          ),

          headline2: TextStyle(
            fontSize: 20,
            color: Colors.cyan[200]
          ),

          headline3: TextStyle(
            fontSize: 20,
            color: Colors.pink[500]
          )

        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            textStyle: TextStyle(
              fontSize: 24
            ) 
          )
        )
      ),
    )
  );
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  //Declaração dos atributos que serao utilizados para controlar os valores informados nos campos de texto

  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();

  //Definindo grupo de input(formulario)
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              print("botão pressionado");
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),

      backgroundColor: Theme.of(context).backgroundColor,

      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Icon(
                Icons.people,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              campoTexto("Peso",txtPeso),
              campoTexto("Altura", txtAltura),
              botao("Calcular")
            ],
          ),
        ),
      ),
    );
  }

  //Campo para entrada de dados

  Widget campoTexto(rotulo, variavel){
    return Container(

      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(

        //indicar a variavel de controle
        controller: variavel,

        style: Theme.of(context).textTheme.headline1,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline3,

          hintText: 'Entre com o valor',
          hintStyle: Theme.of(context).textTheme.headline2,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),

        //Validador

        validator: (value){
          value = value!.replaceFirst(',', '.');
          if(double.tryParse(value) == null){
            return 'Entre com um valor númerico';
          }else{
            return null;
          }
        },
      ),

    );
  }

  Widget botao(rotulo){
    return Container(
      width: 250,
      height: 80,
      padding: EdgeInsets.only(top: 20),

      child: ElevatedButton(
        child: Text(rotulo),
        onPressed: (){
          if(formKey.currentState!.validate()){
            setState(() {
              double peso = double.parse(txtPeso.text);
              double altura = double.parse(txtAltura.text.replaceAll(',', '.'));
              double imc = peso / pow(altura, 2);
              cxDialog('IMC: ${imc.toStringAsFixed(2)}');
            });
          }

        },
      ),
    );
  }

  cxDialog(msg){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Resultado"),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Fechar")
            )
          ],
        );
      }
    );
  }
}