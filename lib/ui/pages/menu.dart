// ignore: import_of_legacy_library_into_null_safe
import 'package:alitas_go/ui/pages/chat.dart';
import 'package:alitas_go/ui/pages/listaPedidos.dart';
import 'package:alitas_go/ui/pages/productopage.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../autf/loginf.dart';
import 'addproductopage.dart';


class MenuAdministrador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu',
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
  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu principal'),
        actions: [
          IconButton(
              tooltip: 'Cerrar sesión',
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginF()),
                );
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
        child: Column(
          children: <Widget>[
            /*Text('Ajustes',
                style: TextStyle(
                    fontSize: 25, color: Colors.black)),*/

            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/registrarproducto");
                            },
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Center(
                                child: Text("Registrar productos",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Material(child:ListaProductos() )),
                              );
                            },
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Center(
                                child: Text("Monitorear pedidos",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Material(child: ChatLinea())),
                              );
                            },
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Center(
                                child: Text("Chat en linea",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductoView()),
                              );
                            },
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Center(
                                child: Text("Consultar inventario",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.brightness_7_rounded,
          Icons.home_rounded,
          Icons.fastfood_outlined,
          Icons.article_outlined,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.brightness_7_rounded,
          Icons.home_rounded,
          Icons.fastfood_outlined,
          Icons.article_outlined,

          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/home");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/pedidos");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/mapa");
            }
          });
        },
        bodyBgColor: _bgColor,
        highlightColor: Color.fromARGB(255, 192, 5, 5),
        navFgColor: Colors.black,
        navBgColor: Color.fromARGB(255, 217, 52, 7),
      ),
    );
  }
}
