import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/dog_entity.dart';
import '../entities/cat_entity.dart';

abstract class IAnimalRepository {
  Future<Either<IFailure, List<Cat>>> getCatsFromRemote();
  Future<Either<IFailure, List<Dog>>> getDogsFromRemote();
}
