import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {

  static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer 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');
  static final HttpLink httpLink = HttpLink('https://api.github.com/graphql');

  static ValueNotifier<GraphQLClient> initializeClient() {
    final Link link = authLink.concat(httpLink);
    return ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
}


// class GraphQLService {
//   final GraphQLClient client;
//
//   GraphQLService({required this.client});
//
//   Future<QueryResult> performQuery(String query, {Map<String, dynamic>? variables}) async {
//     final QueryOptions options = QueryOptions(
//       document: gql(query),
//       variables: variables ?? {},
//     );
//
//     final QueryResult result = await client.query(options);
//
//     if (result.hasException) {
//       throw Exception(result.exception.toString());
//     }
//
//     return result;
//   }
//
//   Future<QueryResult> performMutation(String mutation, {Map<String, dynamic>? variables}) async {
//     final MutationOptions options = MutationOptions(
//       document: gql(mutation),
//       variables: variables ?? {},
//     );
//
//     final QueryResult result = await client.mutate(options);
//
//     if (result.hasException) {
//       throw Exception(result.exception.toString());
//     }
//
//     return result;
//   }
// }
