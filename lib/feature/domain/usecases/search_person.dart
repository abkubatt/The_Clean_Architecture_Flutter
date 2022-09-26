import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/error/filure.dart';
import 'package:rick_and_morty/core/usecases/usecase.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class SearchPerson extends UseCase<List<PersonEntity>, SearchPersonParam> {
  final PersonRepository personRepository;

  SearchPerson(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(
      SearchPersonParam params) async {
    return await personRepository.searchPerson(params.query);
  }
}

class SearchPersonParam extends Equatable {
  final String query;

  SearchPersonParam({required this.query});

  @override
  List<Object?> get props => [query];
}
