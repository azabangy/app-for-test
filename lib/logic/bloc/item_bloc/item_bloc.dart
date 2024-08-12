import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_app/data/services/graphql_service.dart';
import 'package:graph_ql_app/logic/bloc/item_bloc/item_event.dart';
import 'package:graph_ql_app/logic/bloc/item_bloc/item_state.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../data/models/item.dart';
import '../../../data/queries.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GraphQLClient client = GraphQLService.initializeClient().value;



  CountryBloc() : super(CountryInitial()) {
    on<FetchCountries>(_onFetchCountries);
  }
  _onFetchCountries(FetchCountries event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      QueryResult result = await client.query(
        QueryOptions(document: gql(fetchCountriesQuery),
        ),
      );
      if (result.hasException) {
        debugPrint(' items error is : ${result.exception.toString()}');
        emit(CountryError(message: result.exception.toString()));
      } else {
        final List<Country> items = result.data?['countries']
            .map<Country>((json) => Country.fromJson(json)).toList();
        debugPrint('\nitems is : ${items.toString()}\n');
        emit(CountryLoaded(countries: items));
      }
    } catch (e) {
      emit(CountryError(message: e.toString()));



    }
  }


  // Future<void> _onLoadMoreCountries(LoadMoreCountries event, Emitter<CountryState> emit) async {
  //   currentPage++;
  //   try {
  //     final result = await client.query(
  //       QueryOptions(
  //         document: gql(fetchCountriesQuery),
  //         variables: {'limit': 10, 'offset': currentPage * 10},
  //       ),
  //     );
  //     if (result.hasException) {
  //       emit(CountryError(message: result.exception.toString()));
  //     } else {
  //       final countries = (result.data?['countries'] as List)
  //           .map((country) => Country.fromJson(country))
  //           .toList();
  //       final currentState = state;
  //       if (currentState is CountryLoaded) {
  //         emit(CountryLoaded( countries: (currentState.countries ?? []) + countries));
  //       }
  //     }
  //   } catch (e) {
  //     emit(CountryError(message:e.toString()));
  //   }
  // }
}