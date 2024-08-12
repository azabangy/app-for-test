import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_app/data/services/graphql_service.dart';
import 'package:graph_ql_app/presentation/ui/repository_page/repository_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'logic/bloc/repository_bloc/repository_bloc.dart';

void main() {
  final ValueNotifier<GraphQLClient> client = GraphQLService.initializeClient();
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

   const MyApp({super.key , required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => RepositoryBloc(),
            child:  RepositoryPage(),
          ),
        ),
      ),
    );
  }
}
// 00971551072925