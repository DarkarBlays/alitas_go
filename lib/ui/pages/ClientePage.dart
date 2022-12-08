import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() => runApp(const ClientePage());

class ClientePage extends StatelessWidget {
  const ClientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        actions: [
          IconButton(onPressed: (){
            Get.offAllNamed('/loginf');
          }, icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),

       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/listarProductos');
        },
        child: const Icon(Icons.add),
        
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Menu',
            
          ),
          NavigationDestination(
            icon: Icon(Icons.motorcycle_outlined),
            label: 'Domicilio',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_checkout),
            label: 'Productos',
          ),
        ],
      ),
      body: <Widget>[
        
        Container(
                  width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://alitasgo2022.000webhostapp.com/MenuAlitasGO.png"),
                fit: BoxFit.cover)),
         
          alignment: Alignment.center,
          //child: const Text('Menu'),
          
          
        ),
        Container(
                  width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                fit: BoxFit.cover)),
          
          alignment: Alignment.center,
          child: Text('No hay entregas',style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 38.0,
                  height: 1.4,
                  fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,),
          
        ),
        Container(
          color: Color.fromARGB(255, 222, 10, 10),
          alignment: Alignment.center,
          child: const Text('Productos'),
        ),
      ][currentPageIndex],
    );
  }
}
