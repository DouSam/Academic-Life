import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',

      //
      // ROTAS DE NAVEGAÇÃO
      //
      initialRoute: 't1',
      routes: {
        't1': (context) => Tela1(),
        't2': (context) => Tela2(),
      },


    ),
  );
}

//
// TELA 1
//
class Tela1 extends StatefulWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            OutlinedButton(
              onPressed: (){

                Navigator.pushNamed(context, 't2');

              }, 
              child: Text('próximo'),
            ),    

          ],
        ),
      ),
    );
  }
}

//
// TELA 2
//
class Tela2 extends StatefulWidget {
  const Tela2({Key? key}) : super(key: key);

  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

//
// TELA 3
//
class Tela3 extends StatelessWidget {
  const Tela3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 3'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
      ),
    );
  }
}

//
// TELA 4
//
class Tela4 extends StatelessWidget {
  const Tela4({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text('Tela 4'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
      ),
    );
  }
}
