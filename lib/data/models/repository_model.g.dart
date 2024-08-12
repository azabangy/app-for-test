// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) =>
    RepositoryModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryModelToJson(RepositoryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      viewer: json['viewer'] == null
          ? null
          : Viewer.fromJson(json['viewer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'viewer': instance.viewer,
    };

Viewer _$ViewerFromJson(Map<String, dynamic> json) => Viewer(
      login: json['login'] as String?,
      repositories: json['repositories'] == null
          ? null
          : Repositories.fromJson(json['repositories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewerToJson(Viewer instance) => <String, dynamic>{
      'login': instance.login,
      'repositories': instance.repositories,
    };

Repositories _$RepositoriesFromJson(Map<String, dynamic> json) => Repositories(
      nodes: (json['nodes'] as List<dynamic>?)
          ?.map((e) => RepositoriesNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepositoriesToJson(Repositories instance) =>
    <String, dynamic>{
      'nodes': instance.nodes,
    };

RepositoriesNode _$RepositoriesNodeFromJson(Map<String, dynamic> json) =>
    RepositoriesNode(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      languages: json['languages'] == null
          ? null
          : Languages.fromJson(json['languages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoriesNodeToJson(RepositoriesNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'languages': instance.languages,
    };

Languages _$LanguagesFromJson(Map<String, dynamic> json) => Languages(
      nodes: (json['nodes'] as List<dynamic>?)
          ?.map((e) => LanguagesNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'nodes': instance.nodes,
    };

LanguagesNode _$LanguagesNodeFromJson(Map<String, dynamic> json) =>
    LanguagesNode(
      id: json['id'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$LanguagesNodeToJson(LanguagesNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };
