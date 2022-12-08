import 'package:flutter/material.dart';

import '../../models/producto.dart';

var contextoppal;

class PerfilProducto extends StatelessWidget {
  final idperfilproducto;
  final List<Producto> perfilproductos;
  PerfilProducto({Key? key, required this.perfilproductos, this.idperfilproducto});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario de productos',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
            title: Text("Productos",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left)
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            height: 550,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text('Productos en inventario',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Codigo'),
                                      Text(
                                        perfilproductos[idperfilproducto].IdProducto,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombre'),
                                      Text(
                                        perfilproductos[idperfilproducto]
                                            .Nombre,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Cantidad'),
                                      Text(
                                        perfilproductos[idperfilproducto]
                                            .Cantidad,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Precio'),
                                      Text(perfilproductos[idperfilproducto]
                                          .Precio),
                                    ],
                                  )
                                ],
                              ),
                             
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Descripción'),
                                      Text(
                                        perfilproductos[idperfilproducto]
                                            .Descripcion,
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Text('Acompañamiento'),
                                      Text(perfilproductos[idperfilproducto]
                                          .Acompanamiento),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(height: 10),


                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Fecha de registro'),
                                          Text(
                                            perfilproductos[idperfilproducto]
                                                .FechaRegistro,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ),

                              SizedBox(height: 10),

                              ButtonTheme(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(
                                    width: 350,
                                    height: 30,
                                    child: Center(
                                      child: Text("Volver al menu",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                          textAlign: TextAlign.left),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
