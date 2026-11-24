import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{
  final String nombre;
  final String direccion;
  final String fecha;
  final String cargo;

  const Resultado({
    super.key,
    required this.nombre,
    required this.direccion,
    required this.fecha,
    required this.cargo,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(15),
      color: const Color(0xFF2ECC71),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos Registrados",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Nombre: $nombre'),
          Text('Direccion: $nombre'),
          Text('Nacimiento: $nombre'),
          Text('Cargo: $cargo'),
        ],
      )
    );
  }

}