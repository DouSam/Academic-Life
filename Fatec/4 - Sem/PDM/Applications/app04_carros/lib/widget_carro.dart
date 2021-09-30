import 'package:flutter/material.dart';

class WidgetCarro extends StatelessWidget {

  //ATRIBUTOS
  //Os atributos serão utilizados para receber dados
  //no momento da criação do Widget
  final String marca;
  final String modelo;
  final String foto;

  //CONSTRUTOR
  const WidgetCarro(this.marca,this.modelo,this.foto,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      //MARGENS (externo)
      //margin: EdgeInsets.all(50),
      //margin: EdgeInsets.only(top: 50),
      //margin: EdgeInsets.only(bottom: 50),
      margin: EdgeInsets.fromLTRB(30, 30, 30, 0),

      //ESPAÇAMENTO (interno)
      padding: EdgeInsets.all(20),

      width: MediaQuery.of(context).size.width,
     //height: 300,

      //DECORAÇÃO
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],

        //BORDAS
        border: Border.all(
          color: Colors.deepPurple,
          width: 2,
        ),

        //BORDAS ARREDONDADAS
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),

      ),

      child: Column(
        children: [
          Text(this.marca, style: 
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[100],
            ),
          ),
          Text(this.modelo, style:
            TextStyle(
              fontSize: 28,
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple[100],
            ),
          ),

          SizedBox(height: 10),

          //FOTO do CARRO
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,     
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),  
              ),
            ),
            //child: Image.asset(this.foto, scale: 2.5),

            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),  
              ),
              child: Image.asset(this.foto),
            ),
            
          ),

        ],
      )   
    );
  }
}