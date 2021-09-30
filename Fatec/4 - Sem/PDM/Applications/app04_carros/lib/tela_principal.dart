import 'package:app04_carros/widget_carro.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        backgroundColor: Colors.deepPurple[600],
      ),

      body: Container(
        
        //largura responsivaa
        width: MediaQuery.of(context).size.width,

        color: Colors.deepPurple[200],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              WidgetCarro('Audi','Q8','lib/images/audi_q8.jpg'),
              WidgetCarro('Audi','R8','lib/images/audi_r8.jpg'),
              WidgetCarro('BMW','M2','lib/images/bmw_m2.jpg'),
              WidgetCarro('Ferrari','488','lib/images/ferrari_488.jpg'),
              WidgetCarro('Lamborghini','Huracan','lib/images/lamborghini_huracan.jpg'),
              WidgetCarro('Lamborghini','Urus','lib/images/lamborghini_urus.jpg'),
              WidgetCarro('Maserati','GTS','lib/images/maserati_gts.jpg'),
            ],
          ),
        ),
      ),
     
    );
  }
}