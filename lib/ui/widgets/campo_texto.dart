import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String texto;
  final String? prefixo;
  final TextInputType? teclado;

  const CampoTexto({
    required this.controller,
    required this.texto,
    this.prefixo,
    this.teclado,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: TextField(
        controller: controller,
        keyboardType: teclado ?? TextInputType.number,
        decoration: InputDecoration(
          labelText: texto,
          prefixText: prefixo,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
