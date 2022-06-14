import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:ivoy_prueba/graphqL/end_point.dart';
import 'package:ivoy_prueba/graphqL/get_usd_info.dart';

class UsdInfoProvider extends ChangeNotifier {
  String _name = '';

  // ignore: unnecessary_getters_setters
  String get name => _name;

  set name(String value) {
    _name = value;
  }

  void getUsdInfo(String idBusqueda) async {
    ValueNotifier<GraphQLClient> _client = EndPoint().getClient();
    QueryResult result = await _client.value.query(QueryOptions(
        document: gql(GetUsdInfo.getUsdInfo), variables: {'name': idBusqueda}));
    if (!result.hasException) {
      name = result.data!['currencies'][0]['name'];
    }
    notifyListeners();
  }
}
