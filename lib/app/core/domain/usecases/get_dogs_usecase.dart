import 'package:dartz/dartz.dart';
import 'package:pethero/app/core/data/repositories/animal_repository.dart';

import 'package:pethero/app/core/domain/repositories/i_animal_repository.dart';
import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/core/error/failures.dart';

import '../entities/dog_entity.dart';

class GetDogsUsecase implements UseCase<List<Dog>, NoParams> {
  final IAnimalRepository _animalRepository;
  GetDogsUsecase({
    required AnimalRepository animalRepository,
  }) : _animalRepository = animalRepository;
  @override
  Future<Either<IFailure, List<Dog>>> call(params) async {
    return await _animalRepository.getDogsFromRemote();
  }
}
