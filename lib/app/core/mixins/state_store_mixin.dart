import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../utils/control_state.dart';

part 'state_store_mixin.g.dart';

class StateStore = _StateStoreBase with _$StateStore;

abstract class _StateStoreBase with Store {
  @observable
  ControlState state = ControlState.start;

  List<ControlState> previousState = [ControlState.start];

  @action
  void setControlState(ControlState state) {
    previousState.add(this.state);
    this.state = state;
  }

  undo() {
    if (previousState.isNotEmpty) {
      state = previousState.removeLast();
    } else {
      state = ControlState.start;
    }
  }

  @action
  Future<void> pipeline([BuildContext? context]) async {}
}
