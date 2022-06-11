import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.monetization_on_outlined),
            Text('Etanol x Gasolina'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Valor do Etanol:'),
          TextField(),

          Text('Valor da Gasolina:'),
          TextField(),

          ElevatedButton(
            onPressed: null,
            child: Text('Calcular'),
          ),
        ],
      ),
    );
  }
}