import 'package:awsmorty/features/characters/domain/character_response.dart';
import 'package:awsmorty/features/common/domain/error_model.dart';
import 'package:either_dart/either.dart';

import 'dart:async';

abstract class CharacterRepo {
  Future<Either<HttpAppError, CharacterResponse>> getCharacters();
  Future<Either<HttpAppError, CharacterResponse>> deleteCharacter(
      {required id});
  Future<Either<HttpAppError, CharacterResponse>> updateCharacter(
      {required id, required String newName});
}
