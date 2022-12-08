import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  const Textos({
    Key? key,
    required this.controlarTextos,
    required this.etiqueta,
  }) : super(key: key);

  final TextEditingController controlarTextos;
  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: controlarTextos,
        decoration: InputDecoration(
          filled: true,
          labelText: etiqueta,
          suffix: GestureDetector(
            child: const Icon(Icons.close),
            onTap: () {
              controlarTextos.clear();
            },
          )
        ),
      ),
    );
  }
}