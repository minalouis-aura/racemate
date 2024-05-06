import 'package:freezed_annotation/freezed_annotation.dart';

part 'race.freezed.dart';
part 'race.g.dart';

@freezed
class RaceModel with _$RaceModel {
  const RaceModel._();

  const factory RaceModel({
    required String name,
    String? organizer,
    required String date,
    required String country,
    required String city,
    required String image,
    required String type,
    required String distances,
  }) = _RaceModel;

  factory RaceModel.fromJson(Map<String, dynamic> json) =>
      _$RaceModelFromJson(json);
}
