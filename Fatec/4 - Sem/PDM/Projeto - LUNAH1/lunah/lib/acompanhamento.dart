import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lunah/models/user.dart';
import 'package:lunah/widgetLib.dart';

class Acomapnhamento extends StatefulWidget {
  const Acomapnhamento({ Key? key }) : super(key: key);

  @override
  _AcomapnhamentoState createState() => _AcomapnhamentoState();
}

class _AcomapnhamentoState extends State<Acomapnhamento> {
  @override
  Widget build(BuildContext context) {
    var usr = actualUser;

    CollectionReference colNotificacoes = FirebaseFirestore.instance.collection('notificacoes');

    return Scaffold(
      appBar: AppBar(
        title: Text("LUNAH"),
        actions: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Codigo do exame",
                icon: Icon(Icons.search),
              ),
              controller: null,
            ),
            width: 250,
          )
        ],
      ),
      drawer: hamburguer(usr, context),
      body: StreamBuilder<QuerySnapshot>(
          //fonte de dados (coleção)
          stream: colNotificacoes.snapshots(),

          //exibir os dados retornados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                    child: Text('Não foi possível conectar ao Firebase'));

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              //dados recebidos
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return itemLista(
                          dados.docs[index]['msg'],
                          dados.docs[index].id);
                    });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'enviar');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget itemLista(item, id) {
    return ListTile(
      title: Text(item, style: const TextStyle(fontSize: 25)),
      onTap: () {}
    );
  }
}