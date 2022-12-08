import 'package:alitas_go/domain/controller/productocontroller.dart';
import 'package:alitas_go/ui/pages/menu.dart';
import 'package:alitas_go/ui/pages/productopage.dart';
import 'package:flutter/material.dart';

class AddProducto extends StatefulWidget {
  const AddProducto({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _AddProductoState createState() => _AddProductoState();
}

class _AddProductoState extends State<AddProducto> {
  final TextEditingController NombreController = TextEditingController();
  final TextEditingController PrecioController =  TextEditingController();
  final TextEditingController DescripcionController =  TextEditingController();
  final TextEditingController CantidadController =  TextEditingController();

  bool AcompanamientoController = false;
  String? AcompanamientoTxt = "No";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agregar nuevo producto',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: IconButton(
                  tooltip: 'Ir a menu',
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExampleHomePage()),
                    );
                  }),
            ),
            title: Text("Agregar nuevo producto",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left)),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 20, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child:  TextField(
                  controller: NombreController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nombre del producto',
                    hintText: 'Digite el nombre del producto',
                    icon: new Icon(Icons.production_quantity_limits_sharp),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: PrecioController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    hintText: 'Digite el precio del producto',
                    icon: new Icon(Icons.price_change),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child:  TextField(
                  controller: DescripcionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Descripcion',
                    hintText: 'Digite la descripción del producto',
                    icon: new Icon(Icons.description),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: CantidadController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                    hintText: 'Digite la cantidad del producto',
                    icon: new Icon(Icons.list),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new SwitchListTile(
                  title: Text('¿Tiene acompañamiento?'),
                  value: AcompanamientoController,
                  onChanged: (bool value) {
                    setState(() {
                      AcompanamientoController = value;
                    });
                  },
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                  height: 40,
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: new ElevatedButton(
                      onPressed: () {
                        AdicionarProducto(
                          NombreController.text.trim(),
                          PrecioController.text.trim(),
                          DescripcionController.text.trim(),
                          CantidadController.text.trim(),
                          AcompanamientoController == true
                              ? AcompanamientoTxt = "Si"
                              : AcompanamientoTxt = "No",

                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ProductoView()));
                      },
                      child: SizedBox(
                        width: 350,
                        height: 30,
                        child: Center(
                          child: Text("Guardar producto",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
