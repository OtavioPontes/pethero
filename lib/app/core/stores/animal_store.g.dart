// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimalStore on _AnimalStoreBase, Store {
  final _$listCatsAtom = Atom(name: '_AnimalStoreBase.listCats');

  @override
  List<Cat> get listCats {
    _$listCatsAtom.reportRead();
    return super.listCats;
  }

  @override
  set listCats(List<Cat> value) {
    _$listCatsAtom.reportWrite(value, super.listCats, () {
      super.listCats = value;
    });
  }

  final _$listDogsAtom = Atom(name: '_AnimalStoreBase.listDogs');

  @override
  List<Dog> get listDogs {
    _$listDogsAtom.reportRead();
    return super.listDogs;
  }

  @override
  set listDogs(List<Dog> value) {
    _$listDogsAtom.reportWrite(value, super.listDogs, () {
      super.listDogs = value;
    });
  }

  @override
  String toString() {
    return '''
listCats: ${listCats},
listDogs: ${listDogs}
    ''';
  }
}
