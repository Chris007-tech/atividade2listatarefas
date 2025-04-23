import 'package:flutter/material.dart';
import 'package:listaestudantes/pagina1.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista Estudantes",
      debugShowCheckedModeBanner: false,
      home: Pagina1(),
    );
  }
}
