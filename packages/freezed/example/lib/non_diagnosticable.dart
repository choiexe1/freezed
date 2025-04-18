import 'package:freezed_annotation/freezed_annotation.dart';

part 'non_diagnosticable.freezed.dart';

@freezed
abstract class Example<T> with _$Example<T> {
  factory Example(int a, String b) = _Example<T>;

  factory Example.named(T c) = _Example2<T>;
}

@freezed
abstract class SimpleImplements with _$SimpleImplements {
  const factory SimpleImplements.person(String name, int age) = SimplePerson;

  @With<AdministrativeArea<House>>()
  const factory SimpleImplements.street(String name) = SimpleStreet;

  @With<House>()
  const factory SimpleImplements.city(String name, int population) = SimpleCity;

  @With<House>()
  @Implements<GeographicArea>()
  const factory SimpleImplements.country(String name, int population) =
      SimpleCountry;
}

@freezed
abstract class CustomMethodImplements with _$CustomMethodImplements {
  const CustomMethodImplements._();

  const factory CustomMethodImplements.person(String name, int age) =
      PersonCustomMethod;

  @With<Shop>()
  @With<AdministrativeArea<House>>()
  const factory CustomMethodImplements.street(String name) = StreetCustomMethod;

  @With<House>()
  @Implements<GeographicArea>()
  const factory CustomMethodImplements.city(String name, int population) =
      CityCustomMethod;

  @Implements<Shop>()
  @Implements<GeographicArea>()
  const factory CustomMethodImplements.duplex(String name) = DuplexCustomMethod;

  void function() {}
}

@freezed
abstract class GenericImplements<T> with _$GenericImplements<T> {
  const factory GenericImplements.person(String name, int age) =
      GenericPerson<T>;

  @With<House>()
  @Implements<GeographicArea>()
  const factory GenericImplements.city(String name, int population) =
      GenericCity<T>;
}

abstract class GeographicArea {
  String get name;
}

mixin class AdministrativeArea<T> {}

mixin class House {}

mixin class Shop {}
