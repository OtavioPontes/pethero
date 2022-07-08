import 'package:dartz/dartz.dart';

import 'package:pethero/app/core/data/datasources/i_remote_datasource.dart';
import 'package:pethero/app/core/data/datasources/remote_datasource.dart';
import 'package:pethero/app/core/data/models/user_model.dart';
import 'package:pethero/app/core/domain/entities/user_entity.dart';
import 'package:pethero/app/core/domain/repositories/i_user_repository.dart';
import 'package:pethero/app/core/error/failures.dart';

class UserRepository implements IUserRepository {
  final IRemoteDatasource _remoteDatasource;
  UserRepository({
    required RemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;
  @override
  Future<Either<IFailure, User>> loginRemote({required String email}) async {
    try {
      final UserModel userModel =
          await _remoteDatasource.loginRemote(email: email);
      return Right(userModel.toEntity());
    } on UserFailure catch (e) {
      return Left(e);
    }
  }
}
