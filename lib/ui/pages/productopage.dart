import 'dart:convert';
import 'package:alitas_go/ui/autf/loginf.dart';
import 'package:alitas_go/ui/pages/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alitas_go/models/producto.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:alitas_go/domain/controller/configurl.dart';
import 'package:alitas_go/ui/pages/perfilproducto.dart';




Future<List<Producto>> ListarProductos(http.Client client) async {
  final response = await http.get(Uri.parse(Url + 'ConsultarProducto.php'));
  return compute(listaproductopasar, response.body);
}

List<Producto> listaproductopasar(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar
      .map<Producto>((json) => Producto.fromJson(json))
      .toList();
}

void main() {
  runApp(ProductoView());
}

class ProductoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos registrados en el sistema',
      theme: ThemeData(primarySwatch: Colors.orange),
      routes: <String, WidgetBuilder>{
        '/loginf': (context) => const LoginF(),
        '/home': (context) =>  MenuAdministrador(),
       
      },
      home: MyHomePage(
        title: 'Productos',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.left),
        actions: [
          /*IconButton(
              tooltip: 'Registrar producto',
              icon: Icon(Icons.add,
                  color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProducto()),
                );
              }),*/
        ],
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        tooltip: 'Actualizar',
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.article_outlined,
          Icons.home_rounded,
          Icons.fastfood_outlined,
          Icons.brightness_7_rounded,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.article_outlined,
          Icons.home_rounded,
          Icons.fastfood_outlined,
          Icons.brightness_7_rounded,

          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/home");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/home");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/");
            }
          });
        },

        bodyBgColor: _bgColor,
        highlightColor: Color.fromRGBO(192, 58, 5, 1),
        navFgColor: Colors.black,
        navBgColor: Color.fromRGBO(192, 58, 5, 1),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: ListarProductos(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaProducto(productos: snapshot.data)
              : Text(
            'No hay datos',
            style: TextStyle(color: Colors.black),
          );

        default:
          return Text('Actualizar');
      }
    },
  );
}

class VistaProducto extends StatelessWidget {
  List<Producto> productos;

  VistaProducto({Key? key, required this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productos == null ? 0 : productos.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilProducto(
                          perfilproductos: productos, idperfilproducto: posicion)));
                          },
            /*leading: Container(
              padding: EdgeInsets.all(1.0),
              width: 75,
              height: 75,
              child: Image.network(productos[posicion].Foto),
            ),*/
            title: Text(productos[posicion].Nombre),
            subtitle: Text("Precio " +productos[posicion].Precio +
                " " +
                productos[posicion].Descripcion),
            trailing: Container(
              width: 130,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:
              Text("Cantidad: " + productos[posicion].Cantidad),
              color : Colors.orange,
            ),
          );
        });
  }
}
