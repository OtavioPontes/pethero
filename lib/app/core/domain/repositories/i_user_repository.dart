import 'package:dartz/dartz.dart';
import 'package:pethero/app/core/domain/entities/cat_entity.dart';

import '../../error/failures.dart';
import '../entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<IFailure, User>> loginRemote({required String email});
}
