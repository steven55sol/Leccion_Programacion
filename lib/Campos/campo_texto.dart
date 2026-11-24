import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String titulo;
  final String placeholder;
  final TextEditingController controlador;
  final bool mostrar;

  const CampoTexto({
    super.key,
    required this.titulo,
    required this.placeholder,
    required this.controlador,
    this.mostrar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 12),
        ),

        const SizedBox(height: 5),

        TextFormField(
          controller: controlador,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                color: mostrar ? Colors.green : Colors.grey.shade400,
              ),
            ),
          ),
          validator: (valor) {
            if (valor == null || valor.trim().isEmpty) {
              return 'Este campo es obligatorio';
            }

            return null;
          },
        ),
      ],
    );
  }
}