import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import 'package:pethero/app/core/domain/entities/cat_entity.dart';
import 'package:pethero/app/core/domain/entities/dog_entity.dart';
import 'package:pethero/app/core/domain/usecases/get_cats_usecase.dart';
import 'package:pethero/app/core/domain/usecases/get_dogs_usecase.dart';
import 'package:pethero/app/core/domain/usecases/i_usecase.dart';

part 'animal_store.g.dart';

class AnimalStore = _AnimalStoreBase with _$AnimalStore;

abstract class _AnimalStoreBase with Store {
  final GetCatsUsecase _getCatsUsecase;
  final GetDogsUsecase _getDogsUsecase;
  _AnimalStoreBase({
    required GetCatsUsecase getCatsUsecase,
    required GetDogsUsecase getDogsUsecase,
  })  : _getCatsUsecase = getCatsUsecase,
        _getDogsUsecase = getDogsUsecase;

  @observable
  List<Cat> listCats = ObservableList();
  @observable
  List<Dog> listDogs = ObservableList();

  Future<void> pipeline() async {
    listCats = await _getCatsFromRemote() ?? [];
    listDogs = await _getDogsFromRemote() ?? [];
  }

  Future<List<Cat>?> _getCatsFromRemote() async {
    return handleUseCase(_getCatsUsecase);
  }

  Future<List<Dog>?> _getDogsFromRemote() async {
    return handleUseCase(_getDogsUsecase);
  }
}
