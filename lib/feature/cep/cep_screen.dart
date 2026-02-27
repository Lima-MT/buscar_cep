import 'package:cep_app/feature/cep/cep_model.dart';
import 'package:cep_app/feature/cep/cep_service.dart';
import 'package:cep_app/feature/cep/widgets/get_cep_button.dart';
import 'package:cep_app/feature/cep/widgets/my_text_field.dart';
import 'package:cep_app/feature/cep/widgets/result_cep.dart';
import 'package:flutter/material.dart';

class CepScreen extends StatefulWidget {
  const CepScreen({super.key});

  @override
  State<CepScreen> createState() => _CepScreenState();
}

class _CepScreenState extends State<CepScreen> {
  final TextEditingController _controller = TextEditingController();
  final CepService _service = CepService();
  CepModel? _cep;
  bool _loading = false;

  void _buscarCep() async {
    setState(() => _loading = true);

    final result = await _service.buscarCep(_controller.text);
    setState(() {
      _cep = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Cep', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyTextField(controller: _controller),
            SizedBox(height: 20),
            GetCepButton(onPressed: _buscarCep),
            SizedBox(height: 20),
            if (_loading) CircularProgressIndicator(),
            if (_cep != null)
              ResultCep(
                cep: _controller.text,
                logradouro: _cep!.logradouro.toString(),
                bairro: _cep!.bairro.toString(),
                localidade: _cep!.localidade.toString(),
                uf: _cep!.uf.toString(),
              ),
          ],
        ),
      ),
    );
  }
}
