// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharacterState {
  dynamic get characterStatus => throw _privateConstructorUsedError;
  List<CharacterModel> get characterList => throw _privateConstructorUsedError;
  String? get characterName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterStateCopyWith<CharacterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterStateCopyWith<$Res> {
  factory $CharacterStateCopyWith(
          CharacterState value, $Res Function(CharacterState) then) =
      _$CharacterStateCopyWithImpl<$Res, CharacterState>;
  @useResult
  $Res call(
      {dynamic characterStatus,
      List<CharacterModel> characterList,
      String? characterName});
}

/// @nodoc
class _$CharacterStateCopyWithImpl<$Res, $Val extends CharacterState>
    implements $CharacterStateCopyWith<$Res> {
  _$CharacterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterStatus = freezed,
    Object? characterList = null,
    Object? characterName = freezed,
  }) {
    return _then(_value.copyWith(
      characterStatus: freezed == characterStatus
          ? _value.characterStatus
          : characterStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      characterList: null == characterList
          ? _value.characterList
          : characterList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
      characterName: freezed == characterName
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterStateImplCopyWith<$Res>
    implements $CharacterStateCopyWith<$Res> {
  factory _$$CharacterStateImplCopyWith(_$CharacterStateImpl value,
          $Res Function(_$CharacterStateImpl) then) =
      __$$CharacterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic characterStatus,
      List<CharacterModel> characterList,
      String? characterName});
}

/// @nodoc
class __$$CharacterStateImplCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$CharacterStateImpl>
    implements _$$CharacterStateImplCopyWith<$Res> {
  __$$CharacterStateImplCopyWithImpl(
      _$CharacterStateImpl _value, $Res Function(_$CharacterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterStatus = freezed,
    Object? characterList = null,
    Object? characterName = freezed,
  }) {
    return _then(_$CharacterStateImpl(
      characterStatus: freezed == characterStatus
          ? _value.characterStatus!
          : characterStatus,
      characterList: null == characterList
          ? _value._characterList
          : characterList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
      characterName: freezed == characterName
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CharacterStateImpl implements _CharacterState {
  const _$CharacterStateImpl(
      {this.characterStatus = CharacterStatus.initial,
      final List<CharacterModel> characterList = const [],
      this.characterName})
      : _characterList = characterList;

  @override
  @JsonKey()
  final dynamic characterStatus;
  final List<CharacterModel> _characterList;
  @override
  @JsonKey()
  List<CharacterModel> get characterList {
    if (_characterList is EqualUnmodifiableListView) return _characterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterList);
  }

  @override
  final String? characterName;

  @override
  String toString() {
    return 'CharacterState(characterStatus: $characterStatus, characterList: $characterList, characterName: $characterName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterStateImpl &&
            const DeepCollectionEquality()
                .equals(other.characterStatus, characterStatus) &&
            const DeepCollectionEquality()
                .equals(other._characterList, _characterList) &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(characterStatus),
      const DeepCollectionEquality().hash(_characterList),
      characterName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterStateImplCopyWith<_$CharacterStateImpl> get copyWith =>
      __$$CharacterStateImplCopyWithImpl<_$CharacterStateImpl>(
          this, _$identity);
}

abstract class _CharacterState implements CharacterState {
  const factory _CharacterState(
      {final dynamic characterStatus,
      final List<CharacterModel> characterList,
      final String? characterName}) = _$CharacterStateImpl;

  @override
  dynamic get characterStatus;
  @override
  List<CharacterModel> get characterList;
  @override
  String? get characterName;
  @override
  @JsonKey(ignore: true)
  _$$CharacterStateImplCopyWith<_$CharacterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
