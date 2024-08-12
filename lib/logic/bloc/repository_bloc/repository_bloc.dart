
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_app/data/models/repository_model.dart';
import 'package:graph_ql_app/data/services/graphql_service.dart';
import 'package:graph_ql_app/logic/bloc/repository_bloc/repository_event.dart';
import 'package:graph_ql_app/logic/bloc/repository_bloc/repository_state.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../data/queries.dart';

class RepositoryBloc extends Bloc<RepositoryEvent,RepositoryState>{
   List<RepositoriesNode>? repositories ;

  List<RepositoriesNode>? filterRepositories(
      List<RepositoriesNode> repositories,
      String selectedLanguage,
      ) {
    // Filter the repositories by the selected language
    final filteredRepositories = repositories.where((repo) {
      final language = repo.languages;
      return language != null && language.nodes!.any((lang) => lang.name?.toLowerCase() == selectedLanguage.toLowerCase());
    }).toList();
    return filteredRepositories;
  }

  final GraphQLClient client = GraphQLService.initializeClient().value;
  bool isFiltered = false;
  String selectedLanguage = '';
  RepositoryBloc() : super(RepositoryInitial()){

    on<FetchRepositoryEvent>(_fetchRepository);
    on<FetchFilterRepositoryEvent>(_fetchFilterRepository);

  }
  _fetchRepository(FetchRepositoryEvent event, Emitter<RepositoryState> emit)async{
    emit(RepositoryLoading());
    try{
      QueryResult result = await client.query(
          QueryOptions(document: gql(fetchRepositoryQuery),
              variables:  {
            'afterCursor': event.afterCursor,
          }));
      if(result.hasException){
        debugPrint('Repositories Data exception ${result.data}');
        emit(RepositoryError(error: result.exception.toString()));
      }
      else{
        String? viewer = result.data?['viewer']['login'] ?? '';
        List<RepositoriesNode> repositories = result.data?['viewer']['repositories']['nodes'].
        map<RepositoriesNode>((e) => RepositoriesNode.fromJson(e)).toList();

        emit(RepositoryLoaded(viewer: viewer,repositories: repositories ,
            endCursor: result.data!['viewer']['repositories']['pageInfo']['endCursor'],
            hasNextPage:result.data!['viewer']['repositories']['pageInfo']['hasNextPage'] ));
      }

    }catch(e){
      emit(RepositoryError(error: e.toString()));
    }
  }

  _fetchFilterRepository(FetchFilterRepositoryEvent event, Emitter<RepositoryState> emit)async{
    emit(RepositoryLoading());
    try{
      QueryResult result = await client.query(
          QueryOptions(document: gql(fetchRepositoryQuery),variables:  {
            'afterCursor': event.afterCursor,
          } )

      );
      if(result.hasException){
        debugPrint('Repositories Data exception ${result.data}');
        emit(RepositoryError(error: result.exception.toString()));
      }
      else{
        String? viewer = result.data?['viewer']['login'] ?? '';
        List<RepositoriesNode> repositories = result.data?['viewer']['repositories']['nodes'].
        map<RepositoriesNode>((e) => RepositoriesNode.fromJson(e)).toList();

        List<RepositoriesNode>? filteredRepositories = filterRepositories( repositories,selectedLanguage);
        debugPrint(' \n Repositories Data $filteredRepositories \n ');


        emit(RepositoryLoaded(viewer: viewer,repositories:filteredRepositories ?? [],
        endCursor: result.data!['viewer']['repositories']['pageInfo']['endCursor'],
        hasNextPage: result.data!['viewer']['repositories']['pageInfo']['hasNextPage'] ));
      }
    }catch(e){
      emit(RepositoryError(error: e.toString()));
    }
  }


}
// 01098740482