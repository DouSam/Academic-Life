
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lunah/enviar.dart';
import 'package:lunah/models/resultado.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/pesquisa.dart';
import 'package:lunah/widgetLib.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var usr = user.actualUser;
    var filtro;
    if (ModalRoute.of(context)!.settings.arguments != null){
      filtro =  ModalRoute.of(context)!.settings.arguments as Filter;
    }else{
      filtro = Filter("", "", "");
    }

    CollectionReference colResultados   = FirebaseFirestore.instance.collection('resultados');
    CollectionReference colNotificacoes = FirebaseFirestore.instance.collection('notificacoes');
    inspect(filtro);
      if(filtro.nome != ""){
        colResultados.where('paciente',isEqualTo: filtro.nome);
      }
      if(filtro.dtnas != ""){
        colResultados.where('dtNas',isEqualTo: filtro.dtnas);
      }
      if(filtro.carteirinha != ""){
        colResultados.where('carteirinha',isEqualTo: filtro.carteirinha);
      }
    
    colNotificacoes.snapshots().listen((event) {
      if(event.docs.isNotEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(event.docs[0]['msg']),
            duration: const Duration(seconds:4)
          )
        );
      }
    });

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
          stream: colResultados.snapshots(),

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
                          dados.docs[index]['paciente'] + "-" + dados.docs[index]['dtEnvio'],
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
      trailing:
          IconButton(icon: const Icon(Icons.aspect_ratio), onPressed: () async{
            CollectionReference colResultados = FirebaseFirestore.instance.collection('resultados');
            colResultados.doc(id).get().then((DocumentSnapshot value) {
              var doc = value.data() as Map;
              if(value.exists){
                var laudo = Resultado(
                  doc['paciente'],
                  doc['medico'],
                  doc['dtEnvio'],
                  doc['dtLaudo'],
                  doc['laudo'],
                  doc['dtPrevi'],
                  doc['prioritario'],
                  doc['carteirinha'],
                  doc['dtNas']
                );
                Navigator.pushNamed(context, 'resultado', arguments: arg(laudo, id));
              }
            });
          }),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alerta'),
              content: Text("Clique no icone."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('fechar'),
                ),
              ],
            );
          }
        );
      },
    );
  }
}
