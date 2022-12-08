import 'dart:math';

import 'package:alitas_go/domain/controller/controluserf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/crearcuenta.dart';

class LoginF extends StatefulWidget {
  const LoginF({Key? key}) : super(key: key);

  @override
  State<LoginF> createState() => _LoginFState();
}

class _LoginFState extends State<LoginF> {
  TextEditingController controluser = TextEditingController();
  TextEditingController controlpassw = TextEditingController();
  ControlAuthFirebase controlu = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://alitasgo2022.000webhostapp.com/wings.jpg'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: Colors.white70,
                margin: EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LogoApp(),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Iniciar sesión en",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Alitas Go",
                          style: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: controluser,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Usuario',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  controluser.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: controlpassw,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.lock),
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  controlpassw.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 15),
                        /*  ElevatedButton(
                          onPressed: () {
                            if (Usuario.text.isNotEmpty &&
                                Pass.text.isNotEmpty) {
                              _login();
                            } else {
                              cajaerror(
                                  context, 'Todos los campos son obligatorios');
                            }
                          },
                          child: Text('Iniciar Sesión',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black)),
                        ),*/
                       
                        ElevatedButton(
                          onPressed: () {
                            controlu
                                .ingresarEmail(
                                    controluser.text, controlpassw.text)
                                .then((value) {
                              if (controlu.emailf != 'Sin Registro') {
                                if (controlu.emailf.contains("@tests.com")) {
                                   Get.offAllNamed('/home');
                                }else{
                                  Get.offAllNamed('/cliente');
                                print("INICIO DE SESION CORRECTO");
                                }
                                ;
                                
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  title: 'Validacion de Usuarios',
                                  message: 'Error formato de email',
                                  icon: Icon(Icons.warning),
                                  duration: Duration(seconds: 5),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }).catchError((e) {
                              Get.showSnackbar(const GetSnackBar(
                                title: 'Validacion de Usuarios',
                                
                                messageText: Text('Error de credenciales'),
                                icon: Icon(Icons.warning),
                                duration: Duration(seconds: 5),
                                backgroundColor: Colors.red,
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 150,
                            height: 30,
                            child: Center(
                              child: Text("Iniciar sesión",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          
                        ),
                         SizedBox(height: 1),
                          
                        TextButton(
                            onPressed: () {
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CrearCuenta()),
                                  );
                            },
                            child: Text("¿No tienes una cuenta? Registrate",style: TextStyle(fontSize: 15.0, color: Colors.black),),
                         
                          
                        ),
        
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LogoApp() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 5, constraints.maxWidth / 5);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(
              "https://cdn.colombia.com/gastronomia/2011/07/25/alitas-a-la-naranja-1478.jpg",
            ),
          ),
        );
      },
    );
  }
}
