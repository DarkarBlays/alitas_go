
import 'package:alitas_go/ui/autf/loginf.dart';
import 'package:alitas_go/ui/pages/ClientePage.dart';
import 'package:alitas_go/ui/pages/chat.dart';
import 'package:alitas_go/ui/pages/listaPedidos.dart';
import 'package:alitas_go/ui/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/menu.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Carrito de Compras',
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginf': (context) => const LoginF(),
        '/home': (context) =>  MenuAdministrador(),
        '/mapa':(context) => const Maps(),
        '/cliente' :(context)=> const ClientePage(),
        '/pedidos':(context)=> ListaProductos(),
        '/chat':(context)=>const ChatLinea(),

      },
      home:  const LoginF(),
    );
  }
}