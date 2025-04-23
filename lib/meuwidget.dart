import 'package:flutter/material.dart';

class Meuwidget extends StatelessWidget {
  final String nome;
  final String curso;
  final Function() onDelete;
  const Meuwidget(
      {required this.nome,
      required this.curso,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    curso,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),

              Expanded(child: Text("")), //ou
              //Expanded(child: SizedBox()), //ou
              //Spacer(),

              IconButton(
                onPressed: () {
                  onDelete();
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }
}
