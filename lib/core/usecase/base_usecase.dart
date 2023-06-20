


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

abstract class BaseUseCase<Type, Equatable> {
  Future<Either<Failure, Type>> call(Equatable params);
}

class DefaultParams extends Equatable {
  @override
  List<Object> get props => [];
}