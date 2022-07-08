import 'package:dartz/dartz.dart';

import 'package:pethero/app/core/data/repositories/user_repository.dart';
import 'package:pethero/app/core/domain/entities/user_entity.dart';
import 'package:pethero/app/core/domain/repositories/i_user_repository.dart';
import 'package:pethero/app/core/domain/usecases/i_usecase.dart';
import 'package:pethero/app/core/error/failures.dart';

class LoginUsecase implements UseCase<User, ParamsLoginUsecase> {
  final IUserRepository _userRepository;
  LoginUsecase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;
  @override
  Future<Either<IFailure, User>> call(params) async {
    return await _userRepository.loginRemote(email: params.email);
  }
}

class ParamsLoginUsecase extends IParams {
  final String email;
  ParamsLoginUsecase({
    required this.email,
  });
}
