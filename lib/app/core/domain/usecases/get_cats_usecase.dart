import 'package:dartz/dartz.dart';
import 'package:pethero/app/core/data/repositories/animal_repository.dart';

import 'package:pethero/app/core/domain/entities/cat_entity.dart';
import 'package:pethero/app/core/domain/repositories/i_animal_repository.dart';
import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/core/error/failures.dart';

class GetCatsUsecase implements UseCase<List<Cat>, NoParams> {
  final IAnimalRepository _animalRepository;
  GetCatsUsecase({
    required AnimalRepository animalRepository,
  }) : _animalRepository = animalRepository;
  @override
  Future<Either<IFailure, List<Cat>>> call(params) async {
    return await _animalRepository.getCatsFromRemote();
  }
}
