import 'package:flutter/material.dart';
import 'package:listaestudantes/estudante.dart';
import 'package:listaestudantes/meuwidget.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  var listaestudantes = [
    Estudante(nome: "Nome1", curso: "TADS"),
    Estudante(nome: "Matias", curso: "TADS"),
    Estudante(nome: "Santiago", curso: "TADS"),
    Estudante(nome: "Victor", curso: "CC"),
    Estudante(nome: "Fulano", curso: "Engenharia"),
  ];
  void _delete(int index) {
    setState(() {
      listaestudantes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Estudantes"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: listaestudantes.length,
        itemBuilder: (context, index) {
          //return Text(listaestudantes[index]);
          return Meuwidget(
            nome: listaestudantes[index].nome,
            curso: listaestudantes[index].curso,
            onDelete: () {
              _delete(index);
            },
          );
        },
      ),
    );
  }
}
