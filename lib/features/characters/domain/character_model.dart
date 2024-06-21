import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required String state,
    required String urlImage,
    required String gender,
    required String species,
    required String location,
    required String origin,
    required int episodesNumber,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"],
      name: json["name"],
      state: json["status"],
      urlImage: json["image"],
      gender: json["gender"],
      species: json["species"],
      location: json["location"]["name"],
      origin: json["origin"]["name"],
      episodesNumber: json["episode"].length,
    );
  }
}
