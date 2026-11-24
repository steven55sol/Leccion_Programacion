import 'package:flutter/material.dart';
import '../formulario/PantallaReagistro.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Empresa XYZ - Registro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B3A),
        ),
        useMaterial3: true,
      ),
      home: const PantallaRegistro(),
    );
  }
}
