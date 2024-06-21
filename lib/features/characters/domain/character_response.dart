import 'package:awsmorty/features/characters/domain/character_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_response.freezed.dart';

@freezed
class CharacterResponse with _$CharacterResponse {
  const factory CharacterResponse({
    List<CharacterModel>? characterList,
  }) = _CharacterResponse;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    List<CharacterModel>? characters;
    try {
      characters = (json["results"] as List).map(
        (character) {
          return CharacterModel.fromJson(character);
        },
      ).toList();
    } catch (e) {
      debugPrint("Error  $e");
    }

    return CharacterResponse(
      characterList: characters,
    );
  }
}
