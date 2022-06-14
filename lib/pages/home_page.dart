import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ivoy_prueba/provider/euro_provider.dart';

import 'package:ivoy_prueba/pages/detalle_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<EuroProvider>(context, listen: false).getLatestEuro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ivoy Prueba'),
        ),
        body: Consumer<EuroProvider>(builder: (_, euroProvider, child) {
          return (euroProvider.items.isEmpty)
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: euroProvider.items.length,
                  itemBuilder: (context, index) {
                    return Items(
                        titulo: euroProvider.items[index]['baseCurrency'],
                        subtitulo: euroProvider.items[index]['quoteCurrency'],
                        date: euroProvider.items[index]['date']);
                  });
        }));
  }
}

class Items extends StatelessWidget {
  const Items(
      {Key? key,
      required this.titulo,
      required this.subtitulo,
      required this.date})
      : super(key: key);

  final String titulo;
  final String subtitulo;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(titulo + '-' + date),
        trailing: const Icon(Icons.arrow_right),
        subtitle: Text(subtitulo),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetallePage(idBusqueda: subtitulo)));
        });
  }
}
