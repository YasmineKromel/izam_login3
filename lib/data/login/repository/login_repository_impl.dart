


import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:izam_login/core/error/exceptions.dart';

import 'package:izam_login/core/error/failures.dart';

import 'package:izam_login/domain/login/entity/login-entity.dart';

import '../../../domain/login/repository/LoginRepository.dart';
import '../../common/database/database_helper.dart';

class LoginRepositoryImpl implements LoginRepository{

  final DatabaseHelper helper;
  LoginRepositoryImpl({required this.helper});

  @override
  Future<Either<Failure, int>> addUser(LoginEntity login) async{
   try{
     Map<String, dynamic> row = {
       DatabaseHelper.columnMail: login.email,
       DatabaseHelper.columnPassword: login.password,
       DatabaseHelper.columnTimesOfLogin: 1,
     };
     final  int response = await helper.insert(row);
     return Right(response);
   } on ConnectionException{
     return Left(NoDataFailure());
   }
  }

  @override
  Future<Either<Failure, bool>> login(LoginEntity login) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> queryAllUsers() async {
    try{
      final response = await helper.queryAllRows();
      return Right(response);
    }
    on ConnectionException{
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, int>> updateUser(LoginEntity login) async {
    try{
      Map<String, dynamic> row = {
        DatabaseHelper.columnMail: login.email,
        DatabaseHelper.columnPassword: login.password,
        DatabaseHelper.columnTimesOfLogin: login.times,
      };
      final response = await helper.update(row);
      return Right(response);
    } on ConnectionException{
      return Left(NoDataFailure());
    }
  }

}