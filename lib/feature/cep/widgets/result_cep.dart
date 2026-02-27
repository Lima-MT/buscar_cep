import 'package:flutter/material.dart';

class ResultCep extends StatelessWidget {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  const ResultCep({
    super.key,
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Center(
            child: Text(
              cep,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Logradouro: $logradouro',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Bairro: $bairro',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),

          ListTile(
            title: Text(
              'Cidade: $localidade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Estado: $uf',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
