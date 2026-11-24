import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final bool mostrar;
  final String nombre;
  final String direccion;
  final String fecha;
  final String cargo;

  const Resultado({
    super.key,
    required this.mostrar,
    required this.nombre,
    required this.direccion,
    required this.fecha,
    required this.cargo,
  });

  @override
  Widget build(BuildContext context) {
    if (!mostrar) {
      return Container(
        width: double.infinity,
        height: 85,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Text(
          'Aquí se mostrarán los datos\nal presionar el botón',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3EC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DATOS REGISTRADOS',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 5),

          Text('Nombre: $nombre'),
          Text('Dirección: $direccion'),
          Text('Nacimiento: $fecha'),
          Text('Cargo: $cargo'),
        ],
      ),
    );
  }
}