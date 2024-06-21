import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'character_event.freezed.dart';

///Run 'flutter pub run build_runner build or fvm flutter pub run build_runner build' to generate required files
///
///
@freezed
class CharacterEvent {
  const factory CharacterEvent() = _Character;
  factory CharacterEvent.getCharacters() = GetCharacters;
  factory CharacterEvent.changeName({
    required int id,
    required String name,
    required bool fromHome,
  }) = ChangeName;
  factory CharacterEvent.deleteCharacter(
      {required int id, required VoidCallback onSuccess}) = DeleteCharacter;
  factory CharacterEvent.updateCharacter(
      {required int id, required VoidCallback onSuccess}) = UpdateCharacter;
}
