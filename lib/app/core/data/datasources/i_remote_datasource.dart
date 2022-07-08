import 'package:pethero/app/core/data/models/dog_model.dart';
import 'package:pethero/app/core/data/models/user_model.dart';

import '../models/cat_model.dart';

abstract class IRemoteDatasource {
  Future<UserModel> loginRemote({required String email});
  Future<List<DogModel>> getDogs();
  Future<List<CatModel>> getCats();
}
