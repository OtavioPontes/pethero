import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import 'package:pethero/app/core/domain/entities/user_entity.dart';
import 'package:pethero/app/core/error/failures.dart';
import 'package:pethero/app/modules/login/login_module.dart';

import '../data/models/user_model.dart';

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

  Future<void> setUser(User? user) async {
    loggedUser = user;
    if (user != null) {
      await _box.put(
        'logged_user',
        UserModel.fromEntity(user).toJson(),
      );
    }
  }

  Future<void> logout() async {
    setUser(null);
    await _box.delete('logged_user');
    Modular.to.pushReplacementNamed(LoginModule.routeName);
  }

  Future<User?> _getUserFromLocal() async {
    try {
      return UserModel.fromJson(
        await _box.get(
          'logged_user',
        ),
      ).toEntity();
    } catch (e) {
      return null;
    }
  }
}
