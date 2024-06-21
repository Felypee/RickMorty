import 'package:awsmorty/features/characters/domain/character_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'character_state.freezed.dart';

///Run 'flutter pub run build_runner build or fvm flutter pub run build_runner build' to generate required files
///
///
///
enum CharacterStatus { initial, loading, success, failure }

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState(
      {@Default(CharacterStatus.initial) characterStatus,
      @Default([]) List<CharacterModel> characterList,
      String? characterName}) = _CharacterState;
}
