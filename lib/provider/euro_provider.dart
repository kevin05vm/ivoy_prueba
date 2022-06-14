import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:ivoy_prueba/graphqL/end_point.dart';
import 'package:ivoy_prueba/graphqL/get_latest_euro.dart';

class EuroProvider extends ChangeNotifier {
  List<dynamic> _items = [];

  // ignore: unnecessary_getters_setters
  List<dynamic> get items => _items;

  set items(List<dynamic> value) {
    _items = value;
  }

  void getLatestEuro() async {
    ValueNotifier<GraphQLClient> _client = EndPoint().getClient();
    QueryResult result = await _client.value
        .query(QueryOptions(document: gql(GetLatestEuro.getLatestEuro)));
    if (!result.hasException) {
      items = result.data!['latest'];
    }
    notifyListeners();
  }
}
