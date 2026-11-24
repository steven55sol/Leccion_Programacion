import 'package:flutter/material.dart';
import 'formulario/PantallaRegistro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Empresa XYZ - Registro",
      theme: ThemeData(
        primaryColor: const Color(0xFF2ECC71),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2ECC71)),
      ),
      home: PantallaRegistro(),
    );
  }
}