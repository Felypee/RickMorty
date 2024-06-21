import 'dart:convert';

import 'package:awsmorty/features/characters/domain/character_repo.dart';
import 'package:awsmorty/features/characters/domain/character_response.dart';
import 'package:awsmorty/features/common/domain/error_model.dart';
import 'package:awsmorty/utils/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter/material.dart';

class CharacterService extends CharacterRepo {
  @override
  Future<Either<HttpAppError, CharacterResponse>> getCharacters() async {
    try {
      final response = await DioClient.dio.get('/getCharacters');
      final convertedResponse =
          CharacterResponse.fromJson(jsonDecode(response.data));
      return Right(convertedResponse);
    } on DioException catch (error) {
      debugPrint("getcharacter error $error");
      if (error.response != null) {
        return Left(
            HttpAppError(message: error.response!.data["message"].toString()));
      }
      return Left(HttpAppError(message: error.toString() ?? "No message"));
    }
  }

  @override
  Future<Either<HttpAppError, CharacterResponse>> updateCharacter(
      {required id, required String newName}) async {
    try {
      final response =
          await DioClient.dio.put('/updateCharacter?id=$id&newName=$newName');
      final convertedResponse =
          CharacterResponse.fromJson(jsonDecode(response.data));
      return Right(convertedResponse);
    } on DioException catch (error) {
      debugPrint("getcharacter error $error");
      if (error.response != null) {
        return Left(
            HttpAppError(message: error.response!.data["message"].toString()));
      }
      return Left(HttpAppError(message: error.toString() ?? "No message"));
    }
  }

  @override
  Future<Either<HttpAppError, CharacterResponse>> deleteCharacter(
      {required id}) async {
    try {
      final response = await DioClient.dio.delete('/deleteCharacter?id=$id');
      final convertedResponse =
          CharacterResponse.fromJson(jsonDecode(response.data));
      return Right(convertedResponse);
    } on DioException catch (error) {
      debugPrint("getcharacter error $error");
      if (error.response != null) {
        return Left(
            HttpAppError(message: error.response!.data["message"].toString()));
      }
      return Left(HttpAppError(message: error.toString() ?? "No message"));
    }
  }
}
