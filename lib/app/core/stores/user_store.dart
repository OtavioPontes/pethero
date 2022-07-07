import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import 'package:pethero/app/core/domain/entities/user_entity.dart';
import 'package:pethero/app/core/error/failures.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  User? loggedUser;
  final Box _box;
  _UserStoreBase({
    required Box box,
  }) : _box = box;

  void pipeline() async {
    setUser(await _getUserFromLocal());
  }

  void setUser(User? user) => loggedUser = user;

  Future<User?> _getUserFromLocal() async {
    return await _box.get('logged_user');
  }
}
