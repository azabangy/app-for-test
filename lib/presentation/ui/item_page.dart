import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_app/presentation/ui/item_details_page.dart';
import '../../logic/bloc/item_bloc/item_bloc.dart';
import '../../logic/bloc/item_bloc/item_event.dart';
import '../../logic/bloc/item_bloc/item_state.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitial) {
            context.read<CountryBloc>().add(FetchCountries());
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                  ),
                  onChanged: (value) {
                    // context.read<ItemBloc>().add(FetchItems(search: value));
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.countries?.length,
                    itemBuilder: (context, index) {

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItemDetailsPage(),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(state.countries?[index].name ?? 'item not found'),
                          subtitle: Text(state.countries?[index].capital ?? 'item not found'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is CountryError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
