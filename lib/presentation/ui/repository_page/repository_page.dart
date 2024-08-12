
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql_app/logic/bloc/repository_bloc/repository_event.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../data/models/repository_model.dart';
import '../../../logic/bloc/repository_bloc/repository_bloc.dart';
import '../../../logic/bloc/repository_bloc/repository_state.dart';

class RepositoryPage extends StatelessWidget {
   RepositoryPage({super.key});
  List<RepositoriesNode>? repositories ;



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Repositories'),
        actions:  [
          DropdownMenu(
            onSelected: (selectedValue) {
              if(selectedValue == 'All'){
                context.read<RepositoryBloc>().isFiltered = false;
                context.read<RepositoryBloc>().add(const FetchRepositoryEvent());
              }else{
                context.read<RepositoryBloc>().isFiltered = true;
                context.read<RepositoryBloc>().selectedLanguage = selectedValue.toString();
                context.read<RepositoryBloc>().add(const FetchFilterRepositoryEvent());
              }
            },
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey[200]!),
            ),
              initialSelection:   'All',
              dropdownMenuEntries: const [
            DropdownMenuEntry(value: 'All', label: 'All'),
            DropdownMenuEntry(value: 'Dart', label: 'Dart'),
            DropdownMenuEntry(value: 'JavaScript', label: 'JavaScript'),
            DropdownMenuEntry(value: 'HTML', label: 'HTML'),
            DropdownMenuEntry(value: 'Objective-C', label: 'Objective-C'),
            DropdownMenuEntry(value: 'CMake', label: 'CMake'),
            DropdownMenuEntry(value: 'C', label: 'C'),
            DropdownMenuEntry(value: 'C++', label: 'C++'),
            DropdownMenuEntry(value: 'Kotlin', label: 'Kotlin'),
            DropdownMenuEntry(value: 'Swift', label: 'Swift'),
            DropdownMenuEntry(value: 'Shell', label: 'Shell'),
            DropdownMenuEntry(value: 'Ruby', label: 'Ruby'),
          ]),
        ],
      ),
      body: BlocBuilder<RepositoryBloc,RepositoryState>(
        builder: (context, state) {
          if(state is RepositoryInitial){
            if(context.read<RepositoryBloc>().isFiltered){
              context.read<RepositoryBloc>().add(const FetchFilterRepositoryEvent(

              ));
            }else{
            context.read<RepositoryBloc>().add(const FetchRepositoryEvent(

            ));
            }
            return const Center(child: CircularProgressIndicator());
          }else if(state is RepositoryLoading){

            return const Center(child: CircularProgressIndicator());
          }else if(state is RepositoryLoaded){

            repositories = [...?repositories,...?state.repositories];

            return Column(
              children: [
                Text(state.viewer ?? ''),
                Expanded(child: ListView.builder(
                itemCount: repositories?.length ?? 0
                ,itemBuilder: (context, index){
                return InkWell(
                  onTap: () async{
                    launchUrlString(repositories?[index].url ?? '');
                  },
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(6)),
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(child: Text(repositories?[index].name ?? '')),
                            Row(
                              children: List.generate(
                                repositories?[index].languages?.nodes?.length ?? 0,
                                (index1) {
                                  return Container(
                                    margin:   const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    child: Text(repositories?[index].languages?.nodes?[index1].name ?? ''),
                                  );
                                },

                              ),
                            ),
                            Text(repositories?[index].description ?? ''),
                          ],
                        ),
                      )),
                );
              }
    )),
                state.hasNextPage ?
                InkWell(
                    onTap: (){
                      context.read<RepositoryBloc>().add( FetchRepositoryEvent(afterCursor:state.endCursor));
                    },
                    child: const Text('Load More')) : Container(),
              ],
            );


          }else if(state is RepositoryError){
            return Text(state.error.toString());
          } else{
            return Container();
          }
        },

      )
    );
  }
}
