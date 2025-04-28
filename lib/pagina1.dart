import 'package:flutter/material.dart';
import 'package:listaestudantes/estudante.dart';
import 'package:listaestudantes/meuwidget.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerCurso = TextEditingController();

  var listaestudantes = [];

  void _delete(int index) {
    setState(() {
      listaestudantes.removeAt(index);
    });
  }

  void _abrirModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controllerNome,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _controllerCurso,
                decoration: InputDecoration(labelText: 'Curso'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String nome = _controllerNome.text.trim();
                  String curso = _controllerCurso.text.trim();

                  if (nome.isNotEmpty && curso.isNotEmpty) {
                    setState(() {
                      listaestudantes.add(
                        Estudante(nome: nome, curso: curso),
                      );
                    });
                    _controllerNome.clear();
                    _controllerCurso.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar'),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
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
          return Meuwidget(
            nome: listaestudantes[index].nome,
            curso: listaestudantes[index].curso,
            onDelete: () => _delete(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirModal(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
