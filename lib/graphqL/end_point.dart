import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class EndPoint {
  final String _endPointUrl =
      "https://swop.cx/graphql?api-key=ea8932f34203c1d82b2eaa4d8fc15f985e1d496624b055a5e1b2efcec1069acb";

  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
        link: HttpLink(_endPointUrl), cache: GraphQLCache(store: HiveStore())));
    return _client;
  }
}
