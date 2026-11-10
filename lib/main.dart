import 'package:flutter/material.dart';

void main() {
  runApp(const ArenaCidadaApp());
}

class ArenaCidadaApp extends StatelessWidget {
  const ArenaCidadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arena Cidadã',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Scaffold(body: Center(child: Text("inicio"))),
    );
  }
}
