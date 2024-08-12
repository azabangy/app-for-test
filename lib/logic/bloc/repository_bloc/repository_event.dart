import 'package:equatable/equatable.dart';

abstract class RepositoryEvent extends Equatable{

  const RepositoryEvent();
  @override
  List<Object> get props => [];
}

class FetchRepositoryEvent extends RepositoryEvent{
  final String? afterCursor;

  const FetchRepositoryEvent({this.afterCursor});
}
class FetchFilterRepositoryEvent extends RepositoryEvent{
  final String? afterCursor;

  const FetchFilterRepositoryEvent({this.afterCursor});
}