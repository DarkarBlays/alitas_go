import 'package:alitas_go/domain/controller/controluserf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CrearCuenta extends StatefulWidget {
  const CrearCuenta({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _AddUsers createState() => _AddUsers();
}

class _AddUsers extends State<CrearCuenta> {
  final TextEditingController nombreController =  TextEditingController();
  final TextEditingController idController =  TextEditingController();
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController contrasenaController =  TextEditingController();
  final TextEditingController contrasena2Controller =  TextEditingController();

  bool terminosController = false;
  String? terminosTxt = "No";
   ControlAuthFirebase controlu = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crear cuenta de usuario',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
            /*  leading: Container(
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
            ),*/
            title: Text("Crear cuenta",
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
                child: new TextField(
                  controller: nombreController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Digite su nombre completo',
                    icon: new Icon(Icons.person_add),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Identificación',
                    hintText: 'Digite su identificación',
                    icon: new Icon(Icons.perm_identity_sharp),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite su email',
                    icon: new Icon(Icons.mail),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: TextField(
                  obscureText: true,
                  controller: contrasenaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Digite su contraseña',
                    icon: new Icon(Icons.key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: TextField(
                  obscureText: true,
                  controller: contrasena2Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Repita su contraseña',
                    icon: new Icon(Icons.key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: SwitchListTile(
                  title: Text('¿Aceptas los terminos y condiciones?'),
                  value: terminosController,
                  onChanged: (bool value) {
                    setState(() {
                      terminosController = value;
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
                    // ignore: unnecessary_new
                    child: new ElevatedButton(
                      onPressed: () {
                        controlu
                            .registrarEmail(emailController.text, contrasenaController.text)
                            .then((value) {
                          if (controlu.emailf != 'Sin Registro') {
                            Get.offAllNamed('/home');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'campos Invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                          }
                        })
                        .catchError((e){
                           Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'se creo correctamente',
                            
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                        })
                        ;
                        // AdicionarUsuario(
                        //   NombreController.text.trim(),
                        //   PrecioController.text.trim(),
                        //   emailController.text.trim(),
                        //   contrasenaController.text.trim(),
                        //   AcompanamientoController == true
                        //       ? AcompanamientoTxt = "Si"
                        //       : AcompanamientoTxt = "No",
                        // );
                      },
                      child: SizedBox(
                        width: 350,
                        height: 30,
                        child: Center(
                          child: Text("Crear cuenta",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginf');
                },
                child: Text(
                  "¿Ya tienes una cuenta? Iniciar sesión",
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
