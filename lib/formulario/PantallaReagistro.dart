import 'package:flutter/material.dart';

import '../Campos/campo_texto.dart';
import '../Campos/resultado.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {

  final formulario = GlobalKey<FormState>();

  final nombre = TextEditingController();
  final direccion = TextEditingController();
  final cargo = TextEditingController();

  String fecha = '';

  bool mostrar = false;

  // Seleccionar fecha
  Future<void> seleccionarFecha() async {
    DateTime? seleccion = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (seleccion != null) {
      setState(() {
        fecha =
        '${seleccion.day.toString().padLeft(2, '0')}/'
            '${seleccion.month.toString().padLeft(2, '0')}/'
            '${seleccion.year}';
      });
    }
  }

  // Mostrar datos
  void mostrarDatos() {
    if (formulario.currentState!.validate() && fecha.isNotEmpty) {
      setState(() {
        mostrar = true;
      });
    } else if (fecha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seleccione la fecha de nacimiento'),
        ),
      );
    }
  }

  @override
  void dispose() {
    nombre.dispose();
    direccion.dispose();
    cargo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF206B40),
        foregroundColor: Colors.white,
        title: const Text(
          'Empresa XYZ · Registro',
          style: TextStyle(fontSize: 16),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formulario,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Nombre
              CampoTexto(
                titulo: 'Nombre completo',
                placeholder: 'Ej.: Ana María Pérez López',
                controlador: nombre,
                mostrar: mostrar,
              ),

              const SizedBox(height: 15),

              // Dirección
              CampoTexto(
                titulo: 'Dirección',
                placeholder: 'Ej.: Av. 25 de Julio y Pío Jaramillo',
                controlador: direccion,
                mostrar: mostrar,
              ),

              const SizedBox(height: 15),

              // Fecha
              const Text(
                'Fecha de nacimiento',
                style: TextStyle(fontSize: 12),
              ),

              const SizedBox(height: 5),

              InkWell(
                onTap: seleccionarFecha,

                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: mostrar ? Colors.green : Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fecha.isEmpty ? 'dd/mm/aaaa' : fecha,
                        style: TextStyle(
                          fontSize: 12,
                          color: fecha.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),

                      const Icon(
                        Icons.calendar_month,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Cargo
              CampoTexto(
                titulo: 'Cargo',
                placeholder: 'Ej.: Asistente administrativo',
                controlador: cargo,
                mostrar: mostrar,
              ),

              const SizedBox(height: 20),

              // Botón
              SizedBox(
                width: double.infinity,
                height: 42,

                child: ElevatedButton(
                  onPressed: mostrarDatos,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF206B40),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),

                  child: const Text(
                    'MOSTRAR DATOS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Resultado
              Resultado(
                mostrar: mostrar,
                nombre: nombre.text,
                direccion: direccion.text,
                fecha: fecha,
                cargo: cargo.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}