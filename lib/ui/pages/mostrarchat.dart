
import 'package:alitas_go/models/chatClass.dart';
import 'package:flutter/material.dart';

class mostrachat extends StatelessWidget {

  final chatClass mostrar;
  const mostrachat({Key? key, required this.mostrar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                     
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.black,),
                ),
                const SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage:  NetworkImage(mostrar.avatarUrl),
                  maxRadius: 20,
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(mostrar.name,style: const TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (Alignment.topLeft),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ( Color.fromARGB(255, 196, 224, 247)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      mostrar.message,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color:  Color.fromARGB(255, 192, 5, 5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: const Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor:  Color.fromARGB(255, 192, 5, 5),
                    elevation: 0,
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}


