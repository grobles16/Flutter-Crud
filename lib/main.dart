import 'package:ejemplo/Pages/create.dart';
import 'package:ejemplo/Pages/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      initialRoute: Mostrar.ROUTE,
      
  
      routes: {
        Mostrar.ROUTE : (_) => Mostrar(),
        Crear.ROUTE : (_) => Crear()
      },
    );
  }
}

