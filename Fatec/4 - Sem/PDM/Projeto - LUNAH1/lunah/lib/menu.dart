import 'package:flutter/material.dart';
import 'package:lunah/user.dart' as user;

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {

    //Nao e necessario validar pois futuramente o validador do form nao ira deixar entrar com a informacao em branco.
    var usr = user.actualUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("LUNAH"),
        actions: [
          Container(
            child:
              TextField(
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
      drawer: Hamburguer(usr),
      body: Container(
        child: Column(
          children: [
            Text(
              "Últimas análises",
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: 
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:
                    Wrap(
                      children: [
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                        card("","",""),
                      ],
                      direction : Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                    ),    
                )
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, 'enviar');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget card(nomePaciente,bytesImage,uniqueId){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, 'resultado');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green.shade200, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.asset(
              "lib/images/tomografia_example.png",
              width: MediaQuery.of(context).size.width * 0.25,
            ),
            Text(
              "Nome do Paciente",
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),   
        clipBehavior: Clip.antiAlias, 
      )
    );
  }
  Widget Hamburguer(usr){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: 
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          size: 48,
                        ),
                        Text(
                          "Douglas",
                          style: Theme.of(context).textTheme.headline2,
                        ), //Ira ficar o nome do usuário, momentaneamente apenas "DOUGLAS"
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          usr.email,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[500],
                          )
                        )
                      ],
                    )
                  ],
                ),
            ),
            ListTile(
              title: Text(
                "Ultimas Analises",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Enviar Exame",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.pushNamed(context, 'enviar');
              },
            ),
            ListTile(
              title: Text(
                "Resultados",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.pushNamed(context, 'pesquisa');
              },
            ),
            ListTile(
              title: Text(
                "Acompanhamento",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.pushNamed(context, 'acompanhamento');
              },
            ),
            ListTile(
              title: Text(
                "Sobre",
                style: Theme.of(context).textTheme.headline3
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
                Navigator.pushNamed(context, 'sobre');
              },
            ),
          ],
        ),
    );
  }
}

