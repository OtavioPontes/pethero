import 'package:dartz/dartz.dart';

import 'package:pethero/app/core/data/datasources/i_remote_datasource.dart';
import 'package:pethero/app/core/data/datasources/remote_datasource.dart';
import 'package:pethero/app/core/data/models/cat_model.dart';
import 'package:pethero/app/core/data/models/dog_model.dart';
import 'package:pethero/app/core/domain/entities/cat_entity.dart';
import 'package:pethero/app/core/domain/entities/dog_entity.dart';
import 'package:pethero/app/core/domain/repositories/i_animal_repository.dart';
import 'package:pethero/app/core/error/failures.dart';

class AnimalRepository implements IAnimalRepository {
  final IRemoteDatasource _remoteDatasource;
  AnimalRepository({
    required RemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;
  @override
  Future<Either<IFailure, List<Cat>>> getCatsFromRemote() async {
    try {
      final List<CatModel> catsModel = await _remoteDatasource.getCats();
      return Right(
        catsModel.map((e) => e.toEntity()).toList(),
      );
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IFailure, List<Dog>>> getDogsFromRemote() async {
    try {
      final List<DogModel> dogsModel = await _remoteDatasource.getDogs();
      return Right(
        dogsModel.map((e) => e.toEntity()).toList(),
      );
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
