import 'package:awsmorty/features/characters/domain/character_repo.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_event.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterRepo repo;
  CharacterBloc({required this.repo}) : super(const CharacterState()) {
    on<GetCharacters>(_getCharacters);
    on<ChangeName>(_changeName);
    on<DeleteCharacter>(_deleteCharacter);
  }

  Future<void> _getCharacters(GetCharacters event, emit) async {
    emit(state.copyWith(characterStatus: CharacterStatus.loading));

    final result = await repo.getCharacters();

    result.fold((error) {
      emit(state.copyWith(characterStatus: CharacterStatus.failure));
    }, (characterResponse) {
      emit(state.copyWith(
          characterStatus: CharacterStatus.success,
          characterList: characterResponse.characterList ?? []));
    });
  }

  Future<void> _deleteCharacter(DeleteCharacter event, emit) async {
    emit(state.copyWith(characterStatus: CharacterStatus.loading));

    final result = await repo.deleteCharacter(id: event.id);
    result.fold((error) {
      emit(state.copyWith(characterStatus: CharacterStatus.failure));
    }, (characterResponse) {
      event.onSuccess();
      emit(state.copyWith(
          characterStatus: CharacterStatus.success,
          characterList: characterResponse.characterList ?? []));
    });
  }

  Future<void> _changeName(ChangeName event, emit) async {
    String nameToValidate = event.name;
    debugPrint(
      "Anme ${nameToValidate.trim().isEmpty}",
    );
    if (nameToValidate.trim().isEmpty) {
      nameToValidate = "Unknown";
    }
    emit(state.copyWith(characterName: nameToValidate));
    if (event.fromHome == false) {
      emit(state.copyWith(characterStatus: CharacterStatus.loading));

      final result =
          await repo.updateCharacter(id: event.id, newName: nameToValidate);
      result.fold((error) {
        emit(state.copyWith(characterStatus: CharacterStatus.failure));
      }, (characterResponse) {
        emit(state.copyWith(
            characterStatus: CharacterStatus.success,
            characterList: characterResponse.characterList ?? []));
      });
    }
  }
}
