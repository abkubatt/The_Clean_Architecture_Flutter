import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/error/filure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}