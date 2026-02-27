import 'package:flutter/material.dart';

class GetCepButton extends StatelessWidget {
  final Function()? onPressed;
  const GetCepButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          'Buscar Cep',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
