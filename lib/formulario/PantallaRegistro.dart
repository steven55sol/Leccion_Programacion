import 'package:flutter/material.dart';
import '../campos/campo_texto.dart';
import '../campos/resultado.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {

  final formKey = GlobalKey<FormState>();

  final nombre = TextEditingController();
  final direccion = TextEditingController();
  final cargo = TextEditingController();

  DateTime? fecha;
  bool mostrar = false;

  Future<void> seleccionarFecha() async {
    final seleccion = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (seleccion != null) {
      setState(() {
        fecha = seleccion;
        mostrar = false;
      });
    }
  }

  void registrar() {
    if (formKey.currentState!.validate() && fecha != null) {
      setState(() {
        mostrar = true;
      });
    } else if (fecha == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seleccione una fecha'),
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
      appBar: AppBar(
        title: const Text('Empresa XYZ - Registro'),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [

              CampoTexto(
                titulo: 'Nombre completo',
                placeholder: 'Ingrese su nombre',
                controller: nombre,
              ),

              const SizedBox(height: 15),

              CampoTexto(
                titulo: 'Dirección',
                placeholder: 'Ingrese su dirección',
                controller: direccion,
              ),

              const SizedBox(height: 15),

              const Text('Fecha de nacimiento'),

              ListTile(
                title: Text(
                  fecha == null
                      ? 'Seleccione una fecha'
                      : '${fecha!.day}/${fecha!.month}/${fecha!.year}',
                ),
                trailing: const Icon(Icons.calendar_month),
                onTap: seleccionarFecha,
              ),

              const SizedBox(height: 15),

              CampoTexto(
                titulo: 'Cargo',
                placeholder: 'Ingrese su cargo',
                controller: cargo,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: registrar,
                child: const Text('MOSTRAR DATOS'),
              ),

              const SizedBox(height: 20),

              if (mostrar)
                Resultado(
                  nombre: nombre.text,
                  direccion: direccion.text,
                  fecha: '${fecha!.day}/${fecha!.month}/${fecha!.year}',
                  cargo: cargo.text,
                ),

            ],
          ),
        ),
      ),
    );
  }
}
