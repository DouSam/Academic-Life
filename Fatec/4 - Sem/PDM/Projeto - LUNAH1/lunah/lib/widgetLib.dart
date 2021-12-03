import 'package:flutter/material.dart';

Widget hamburguer(usr, context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 48,
                  ),
                  Text(
                    usr.nome,
                    style: Theme.of(context).textTheme.headline2,
                  ), //Ira ficar o nome do usuário, momentaneamente apenas "DOUGLAS"
                ],
              ),
              Row(
                children: [
                  Text(usr.email,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                      ))
                ],
              )
            ],
          ),
        ),
        ListTile(
          title: Text("Ultimas Analises",
              style: Theme.of(context).textTheme.headline3),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
            Navigator.popUntil(context, ModalRoute.withName("menu"));
          },
        ),
        ListTile(
          title: Text("Enviar Exame",
              style: Theme.of(context).textTheme.headline3),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
            Navigator.popUntil(context, ModalRoute.withName("menu"));
            Navigator.pushNamed(context, 'enviar');
          },
        ),
        ListTile(
          title:
              Text("Resultados", style: Theme.of(context).textTheme.headline3),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
            Navigator.popUntil(context, ModalRoute.withName("menu"));
            Navigator.pushNamed(context, 'pesquisa');
          },
        ),
        ListTile(
          title: Text("Acompanhamento",
              style: Theme.of(context).textTheme.headline3),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
            Navigator.popUntil(context, ModalRoute.withName("menu"));
            Navigator.pushNamed(context, 'acomp');
          },
        ),
        ListTile(
          title: Text("Sobre", style: Theme.of(context).textTheme.headline3),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
            Navigator.popUntil(context, ModalRoute.withName("menu"));
            Navigator.pushNamed(context, 'sobre');
          },
        ),
      ],
    ),
  );
}

Widget campo(rotulo, fieldControler, fieldType, fieldHint, fieldIcon, fieldObs,
    context) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
    child: TextFormField(
      keyboardType: fieldType,
      controller: fieldControler,
      style: Theme.of(context).textTheme.headline1,
      obscureText: fieldObs,
      decoration: InputDecoration(
        icon: fieldIcon,
        labelText: rotulo,
        labelStyle: Theme.of(context).textTheme.headline2,
        hintText: fieldHint,
        hintStyle: Theme.of(context).textTheme.headline3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget textLong(rotulo, fieldControler, fieldType, fieldHint, fieldIcon, fieldObs,
    context, value) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
    child: TextFormField(
      keyboardType: fieldType,
      minLines: 5,
      maxLines: 50,
      controller: fieldControler,
      style: Theme.of(context).textTheme.headline1,
      obscureText: fieldObs,
      decoration: InputDecoration(
        icon: fieldIcon,
        labelText: rotulo,
        labelStyle: Theme.of(context).textTheme.headline2,
        hintText: fieldHint,
        hintStyle: Theme.of(context).textTheme.headline3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
