// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$animalsAtom = Atom(name: '_HomeControllerBase.animals');

  @override
  List<Animal> get animals {
    _$animalsAtom.reportRead();
    return super.animals;
  }

  @override
  set animals(List<Animal> value) {
    _$animalsAtom.reportWrite(value, super.animals, () {
      super.animals = value;
    });
  }

  final _$pipelineAsyncAction = AsyncAction('_HomeControllerBase.pipeline');

  @override
  Future<void> pipeline([BuildContext? context]) {
    return _$pipelineAsyncAction.run(() => super.pipeline(context));
  }

  @override
  String toString() {
    return '''
animals: ${animals}
    ''';
  }
}
