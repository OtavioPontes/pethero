import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:pethero/app/core/mixins/state_store_mixin.dart';
import 'package:pethero/app/core/stores/animal_store.dart';
import 'package:pethero/app/core/stores/user_store.dart';
import 'package:pethero/app/core/utils/control_state.dart';

import '../../../../core/domain/entities/animal_entity.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends StateStore with Store {
  final AnimalStore _animalStore;

  _HomeControllerBase({
    required AnimalStore animalStore,
  }) : _animalStore = animalStore {
    pipeline();
  }

  @observable
  List<Animal> animals = ObservableList();

  @action
  @override
  Future<void> pipeline([BuildContext? context]) async {
    setControlState(ControlState.start);
    animals.addAll(_animalStore.listCats);
    animals.addAll(_animalStore.listDogs);
    animals.shuffle();
    animals = animals.asObservable();
    setControlState(ControlState.success);
  }
}
