import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:pethero/app/core/data/datasources/i_remote_datasource.dart';
import 'package:pethero/app/core/data/models/dog_model.dart';
import 'package:pethero/app/core/data/models/cat_model.dart';
import 'package:pethero/app/core/data/models/user_model.dart';
import 'package:pethero/app/core/error/failures.dart';
import 'package:pethero/app/core/network/uris.dart';

class RemoteDatasource implements IRemoteDatasource {
  final Dio _dio;
  RemoteDatasource({
    required Dio dio,
  }) : _dio = dio;
  @override
  Future<UserModel> loginRemote({required String email}) async {
    try {
      final String response = await rootBundle.loadString('assets/users.json');
      final data = await json.decode(response);

      for (Map<String, dynamic> map in data) {
        final UserModel user = UserModel.fromMap(map);
        if (user.email != email) {
          continue;
        } else {
          return user;
        }
      }
      throw const UserFailure(
        message: 'Email não foi encontrado 😢',
      );
    } catch (e) {
      throw const ServerFailure(
        message: 'Falha ao logar remotamente',
      );
    }
  }

  @override
  Future<List<CatModel>> getCats() async {
    try {
      final response = await _dio.get(
        URIs.cats,
        queryParameters: {
          'x-api-key': '96349a97-e86c-4157-b603-b289b560bf33',
        },
      );

      List<CatModel> catsFromRemote = [];
      for (Map<String, dynamic> map in response.data) {
        catsFromRemote.add(CatModel.fromMap(map));
      }
      return catsFromRemote;
    } on DioError {
      throw const ServerFailure(
        message: 'Falha ao pegar a lista de gatos remotamente',
      );
    }
  }

  @override
  Future<List<DogModel>> getDogs() async {
    try {
      final response = await _dio.get(
        URIs.dogs,
        queryParameters: {
          'x-api-key': '23457cbc-3048-47bc-9645-bb5d43e8ab30',
        },
      );

      List<DogModel> dogsFromRemote = [];
      for (Map<String, dynamic> map in response.data) {
        dogsFromRemote.add(DogModel.fromMap(map));
      }
      return dogsFromRemote;
    } on DioError {
      throw const ServerFailure(
        message: 'Falha ao pegar a lista de gatos remotamente',
      );
    }
  }
}
