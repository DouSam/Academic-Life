import 'package:flutter/material.dart';

void main() {

  //Executando o app
  runApp(

    //Definir a tela inicial
    MaterialApp(
      title: "App",
      home: TelaPrincipal(),
    )
  );
  
}

// Tela principal
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu aplicativo com flutter"),
        backgroundColor: Colors.yellow,
        ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 100,
                color: Colors.green[100],
              ),
              Container(
                width: 150,
                height: 100,
                color: Colors.blue,
              ),
            ],
          )
        ],
      )
    );
  }
} 