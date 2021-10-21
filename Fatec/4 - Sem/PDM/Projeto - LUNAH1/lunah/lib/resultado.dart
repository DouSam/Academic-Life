import 'package:flutter/material.dart';
import 'package:lunah/user.dart' as user;

class Resultado extends StatefulWidget {
  const Resultado({ Key? key }) : super(key: key);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                "lib/images/tomografia_example.png",
                width: MediaQuery.of(context).size.width * 0.80,
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            Divider(
              height: 10,
              color: Colors.green,
              thickness: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Laudo: ",
                      style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,                        
                      ),
                      children: [
                        TextSpan(
                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vehicula vitae massa quis mollis. Aenean posuere nulla mattis erat imperdiet ornare. Curabitur at erat urna. Aenean lobortis suscipit hendrerit. Fusce interdum convallis leo, sed tempor massa hendrerit eget. Nunc cursus tellus et neque laoreet, non fermentum felis ultrices. Maecenas et eros mollis, faucibus tellus sit amet, luctus elit. Ut tincidunt erat vitae aliquet faucibus. In hac habitasse platea dictumst. Morbi vitae pulvinar nulla. Curabitur interdum odio sed porta elementum. Duis molestie sed sem ac convallis. Integer at erat aliquet, tempus arcu sed, auctor neque. In mollis facilisis odio, ac fermentum eros luctus posuere.\nSuspendisse efficitur ex nec purus dapibus aliquam. Proin quis condimentum dolor. Nunc elementum dictum nisi, non ornare mi pharetra faucibus. Duis a neque non ligula lobortis tempor. Quisque consequat, massa sit amet dictum lobortis, mi nulla posuere nisl, ac cursus diam ante vel libero. Nulla sem massa, aliquam et tempus eleifend, auctor in orci. Quisque ac ipsum diam. In elit nibh, malesuada ultricies ullamcorper at, imperdiet eget magna. Pellentesque gravida turpis eget urna sollicitudin, eu efficitur turpis lobortis. Maecenas gravida ac mauris non dapibus. Phasellus erat mi, scelerisque ac finibus id, vulputate sit amet dui. Pellentesque laoreet quam velit, et molestie justo eleifend sed. Donec suscipit dictum massa, vel imperdiet est accumsan eu.\n In id sapien eget justo volutpat feugiat. Aenean molestie cursus quam, ac luctus libero pellentesque nec. Mauris ornare magna quis rhoncus vestibulum. Donec posuere ante nec rhoncus condimentum. Praesent at lectus cursus, luctus felis in, blandit elit. Vivamus condimentum tellus vitae mollis viverra. Donec sollicitudin purus nulla, sed aliquam diam consectetur et. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet dolor lectus. Aliquam placerat tincidunt erat, eu luctus ex porta ac.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )                        
                        )
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  )
                )
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName("menu"));
                  },
                  child: Text("Menu"), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.45,50),
                    
                  )
                ),
                ElevatedButton(
                  onPressed: (){
                    
                  },
                  child: Text("Encaminhar"), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.45,50)
                  )
                ),                
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      drawer: Hamburguer(user.actualUser),
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
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'menu');
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
                Navigator.popUntil(context, ModalRoute.withName("menu"));
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
                Navigator.popUntil(context, ModalRoute.withName("menu"));
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
                Navigator.popUntil(context, ModalRoute.withName("menu"));
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
                Navigator.popUntil(context, ModalRoute.withName("menu"));
                Navigator.pushNamed(context, 'sobre');
              },
            ),
          ],
        ),
    );
  }
}