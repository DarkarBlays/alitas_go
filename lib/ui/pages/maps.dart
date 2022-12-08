import 'package:flutter/material.dart'; 


class Maps extends StatelessWidget {
const Maps({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        child: Column(children: [Icon(Icons.arrow_back_ios_new),Text("Atras")]),
        onPressed: (() {
        Navigator.pop(context);
      })),
      appBar: AppBar(title: Text("Domicilios"),),
      body: Image.asset("assets/mapa.png" ,fit: BoxFit.fill,height: double.infinity,));
  }
}