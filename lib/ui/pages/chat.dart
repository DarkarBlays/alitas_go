// ignore: import_of_legacy_library_into_null_safe
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:alitas_go/models/chatClass.dart';
import 'addproductopage.dart';
import 'mostrarchat.dart';


class ChatLinea extends StatelessWidget {
  
  const ChatLinea({Key? key,required }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu' ,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
       
        "/registrarproducto": (BuildContext context) => AddProducto(),

      },
      home: ExampleHomePage(),
    );
  }
}
class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  final List _chats = temporalData;
  @override
  Widget build(BuildContext context) {

    Widget notificationCircle(value) {
      return Container(
        child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(color: Colors.white),
            )),
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .accentColor,
          shape: BoxShape.circle,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Chat en línea")),
      body:  ListView.builder(
        itemCount: temporalData.length,
        itemBuilder: (context, i) =>  Column(
          children: <Widget>[
            const Divider(
              height: 5.0,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => mostrachat(mostrar: _chats[i]),//Llamar la Vista 
                    )).then((resultado) //Espera por un Resultado
                {
                  if(resultado != null){
                    temporalData[i] = resultado[0]; 
                    setState(() {});
                  }
                });
              },
              leading:  CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage:  NetworkImage(temporalData[i].avatarUrl),
              ),
              title:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    temporalData[i].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    temporalData[i].time,
                    style:  const TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle:  Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        temporalData[i].message,
                        style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                      temporalData[i].newMessage == 1
                          ? notificationCircle(Random().nextInt(5)+1)
                          : Container()
                    ],
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
