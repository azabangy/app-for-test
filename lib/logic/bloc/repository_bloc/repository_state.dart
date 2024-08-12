import 'package:equatable/equatable.dart';
import 'package:graph_ql_app/data/models/repository_model.dart';

abstract class RepositoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class RepositoryInitial extends RepositoryState {}

class RepositoryLoading extends RepositoryState {}

class RepositoryLoaded extends RepositoryState {
  final bool hasNextPage;
  final String? endCursor;
  final String? viewer;
  final List<RepositoriesNode>? repositories;
  RepositoryLoaded(
      {required this.hasNextPage,
      required this.endCursor,
      required this.viewer,
      required this.repositories});
}

class RepositoryError extends RepositoryState {
  final String error;
  RepositoryError({required this.error});
}
