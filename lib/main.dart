import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'package:ivoy_prueba/provider/euro_provider.dart';
import 'package:ivoy_prueba/provider/usd_info_provider.dart';

import 'package:ivoy_prueba/pages/home_page.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EuroProvider()),
          ChangeNotifierProvider(create: (_) => UsdInfoProvider()),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
