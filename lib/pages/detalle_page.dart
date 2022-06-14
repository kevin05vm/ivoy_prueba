import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ivoy_prueba/provider/usd_info_provider.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({Key? key, required this.idBusqueda}) : super(key: key);

  final String idBusqueda;

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<UsdInfoProvider>(context, listen: false)
          .getUsdInfo(widget.idBusqueda);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vista detalle ' + widget.idBusqueda),
        ),
        body: Consumer<UsdInfoProvider>(builder: (_, euroProvider, child) {
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Nombre: ' + euroProvider.name)]),
          );
        }));
  }
}
