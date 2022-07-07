// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_store_mixin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StateStore on _StateStoreBase, Store {
  final _$stateAtom = Atom(name: '_StateStoreBase.state');

  @override
  ControlState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ControlState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$pipelineAsyncAction = AsyncAction('_StateStoreBase.pipeline');

  @override
  Future<void> pipeline([BuildContext? context]) {
    return _$pipelineAsyncAction.run(() => super.pipeline(context));
  }

  final _$_StateStoreBaseActionController =
      ActionController(name: '_StateStoreBase');

  @override
  void setControlState(ControlState state) {
    final _$actionInfo = _$_StateStoreBaseActionController.startAction(
        name: '_StateStoreBase.setControlState');
    try {
      return super.setControlState(state);
    } finally {
      _$_StateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
