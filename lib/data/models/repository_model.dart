import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_model.g.dart';

@JsonSerializable()
class RepositoryModel extends Equatable {
  const RepositoryModel({
    required this.data,
  });

  final Data? data;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) => _$RepositoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);

  @override
  List<Object?> get props => [
    data, ];
}

@JsonSerializable()
class Data extends Equatable {
  const Data({
    required this.viewer,
  });

  final Viewer? viewer;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [
    viewer, ];
}

@JsonSerializable()
class Viewer extends Equatable {
  const Viewer({
    required this.login,
    required this.repositories,
  });

  final String? login;
  final Repositories? repositories;

  factory Viewer.fromJson(Map<String, dynamic> json) => _$ViewerFromJson(json);

  Map<String, dynamic> toJson() => _$ViewerToJson(this);

  @override
  List<Object?> get props => [
    login, repositories, ];
}

@JsonSerializable()
class Repositories extends Equatable {
  const Repositories({
    required this.nodes,
  });

  final List<RepositoriesNode>? nodes;

  factory Repositories.fromJson(Map<String, dynamic> json) => _$RepositoriesFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoriesToJson(this);

  @override
  List<Object?> get props => [
    nodes, ];
}

@JsonSerializable()
class RepositoriesNode extends Equatable {
  const RepositoriesNode({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.languages,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final Languages? languages;

  factory RepositoriesNode.fromJson(Map<String, dynamic> json) => _$RepositoriesNodeFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoriesNodeToJson(this);

  @override
  List<Object?> get props => [
    id, name, description, url, languages, ];
}

@JsonSerializable()
class Languages extends Equatable {
  const Languages({
    required this.nodes,
  });

  final List<LanguagesNode>? nodes;

  factory Languages.fromJson(Map<String, dynamic> json) => _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);

  @override
  List<Object?> get props => [
    nodes, ];
}

@JsonSerializable()
class LanguagesNode extends Equatable {
  const LanguagesNode({
    required this.id,
    required this.name,
    required this.color,
  });

  final String? id;
  final String? name;
  final String? color;

  factory LanguagesNode.fromJson(Map<String, dynamic> json) => _$LanguagesNodeFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesNodeToJson(this);

  @override
  List<Object?> get props => [
    id, name, color, ];
}
