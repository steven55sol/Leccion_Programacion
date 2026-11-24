import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget{
  final String titulo;
  final String placeholder;
  final TextEditingController controller;

  const CampoTexto({
    super.key,
    required this.titulo,
    required this.placeholder,
    required this.controller
  });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
            validator: (valor){
              if(valor == null || valor.isEmpty){
                return "Este campo es Obligatorio";
              }
              return null;
            }
        )
      ],
    );
  }
}