import 'package:aula01_pos_11_06_2022/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _etanolController = TextEditingController();
  final _gasolinaController = TextEditingController();
  var _resultado = '';

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
        actions: [
          IconButton(onPressed: _calcular, icon: const Icon(Icons.attach_money)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calcular,
        child: const Icon(Icons.attach_money),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
              ),
              child: const Text('Etanol x Gasolina',
                style: TextStyle(fontSize: 44, color: Colors.white),
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.attach_money, color: Colors.black),
                  Text('Calcular', style: TextStyle(fontSize: 20),),
                ],
              ),
              onTap: _calcular,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CampoTexto(
            controller: _etanolController,
            texto: 'Valor do Etanol',
            prefixo: 'R\$ '
          ),

          CampoTexto(
            controller: _gasolinaController,
            texto: 'Valor da Gasolina',
            prefixo: 'R\$ '
          ),

          ElevatedButton(
            onPressed: _calcular,
            child: const Text('Calcular'),
          ),

          Text(_resultado),
        ],
      ),
    );
  }

  void _calcular() {
    double etanol = double.tryParse(_etanolController.text.replaceAll(',', '.')) ?? 0;
    double gasolina = double.tryParse(_gasolinaController.text.replaceAll(',', '.')) ?? 0;

    if (etanol <= 0) {
      mostrarMensagem('Valor do Etanol inválido!');
      return;
    }
    if (gasolina <= 0) {
      mostrarMensagem('Valor da Gasolina inválido');
      return;
    }

    if (etanol <= (gasolina * 0.7)) {
      _resultado = 'Abasteça com Etanol';
    } else {
      _resultado = 'Abasteça com Gasolina';
    }

    mostrarMensagem(_resultado);
    setState(() {});
  }

  void mostrarMensagem(String texto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: Text(texto),
          actions: [
            TextButton(
              onPressed: (){ Navigator.pop(context); },
              child: const Text('Ok'),
            ),
          ],
        );
      }
    );
  }
}