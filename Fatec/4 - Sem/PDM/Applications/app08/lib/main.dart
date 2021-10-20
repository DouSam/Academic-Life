import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarefas',
      home: TarefasPage(),
    ),
  );
}

class TarefasPage extends StatefulWidget {
  const TarefasPage({Key? key}) : super(key: key);

  @override
  _TarefasPageState createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {

  var lista = [];

  @override
  void initState(){
    lista.add("Ir ao supermercado");
    lista.add("Ir ao minimercado");
    lista.add("Ir ao megamercado");
    lista.add("Ir ao gigamercado");
    lista.add("Ir ao minusculomercado");
    lista.add("Ir ao pititicomercado");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.grey.shade200,

        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 10,
              shadowColor: Colors.blue[200],
              child: ListTile(
                title: Text(lista[index],style: TextStyle(fontSize: 22)),
              ),
            );
          },
        ),
      ),

    );
  }
}