import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  const Item({
    required this.data,
  });

  final Data? data;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object?> get props => [
    data, ];
}

@JsonSerializable()
class Data extends Equatable {
  const Data({
    required this.countries,
  });

  final List<Country>? countries;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [
    countries, ];
}

@JsonSerializable()
class Country extends Equatable {
  const Country({
    required this.name,
    required this.capital,
  });

  final String? name;
  final String? capital;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  List<Object?> get props => [
    name, capital, ];
}
