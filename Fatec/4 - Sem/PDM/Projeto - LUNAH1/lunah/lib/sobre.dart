import 'package:flutter/material.dart';
import 'package:lunah/models/user.dart' as user;
import 'package:lunah/widgetLib.dart';

class Sobre extends StatefulWidget {
  const Sobre({ Key? key }) : super(key: key);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:
                Image.asset(
                  "lib/images/foto.JPG",
                  width: MediaQuery.of(context).size.width *0.50,
                ),
            ),
            Row(
              children: [
                Text(
                  "Douglas Samuel Gonçalves",
                  style: TextStyle(
                    fontSize: 24
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Tema:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: " Interface mobile para exibir resultado de tomografias analisadas por outro sistema.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          )
                        )
                      ]
                    ),
                    textAlign: TextAlign.justify,
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Objetivo:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: " O objetivo do aplicativo é exibir resultado de tomografias analisadas por outro sistema, também permitindo enviar novas imagens para que o outro sistema realize a analise. A ideia principal é de que apenas os médicos tenham acesso.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          )
                        )
                      ]
                    ),
                    textAlign: TextAlign.justify,
                  )
                )
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        color: Colors.greenAccent.shade100,
      ),
      drawer: hamburguer(user.actualUser, context),
    );
  }
}