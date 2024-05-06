// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'race.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RaceModel _$RaceModelFromJson(Map<String, dynamic> json) {
  return _RaceModel.fromJson(json);
}

/// @nodoc
mixin _$RaceModel {
  String get name => throw _privateConstructorUsedError;
  String? get organizer => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get distances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RaceModelCopyWith<RaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaceModelCopyWith<$Res> {
  factory $RaceModelCopyWith(RaceModel value, $Res Function(RaceModel) then) =
      _$RaceModelCopyWithImpl<$Res, RaceModel>;
  @useResult
  $Res call(
      {String name,
      String? organizer,
      String date,
      String country,
      String city,
      String image,
      String type,
      String distances});
}

/// @nodoc
class _$RaceModelCopyWithImpl<$Res, $Val extends RaceModel>
    implements $RaceModelCopyWith<$Res> {
  _$RaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? organizer = freezed,
    Object? date = null,
    Object? country = null,
    Object? city = null,
    Object? image = null,
    Object? type = null,
    Object? distances = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      organizer: freezed == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      distances: null == distances
          ? _value.distances
          : distances // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RaceModelImplCopyWith<$Res>
    implements $RaceModelCopyWith<$Res> {
  factory _$$RaceModelImplCopyWith(
          _$RaceModelImpl value, $Res Function(_$RaceModelImpl) then) =
      __$$RaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? organizer,
      String date,
      String country,
      String city,
      String image,
      String type,
      String distances});
}

/// @nodoc
class __$$RaceModelImplCopyWithImpl<$Res>
    extends _$RaceModelCopyWithImpl<$Res, _$RaceModelImpl>
    implements _$$RaceModelImplCopyWith<$Res> {
  __$$RaceModelImplCopyWithImpl(
      _$RaceModelImpl _value, $Res Function(_$RaceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? organizer = freezed,
    Object? date = null,
    Object? country = null,
    Object? city = null,
    Object? image = null,
    Object? type = null,
    Object? distances = null,
  }) {
    return _then(_$RaceModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      organizer: freezed == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      distances: null == distances
          ? _value.distances
          : distances // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RaceModelImpl extends _RaceModel {
  const _$RaceModelImpl(
      {required this.name,
      this.organizer,
      required this.date,
      required this.country,
      required this.city,
      required this.image,
      required this.type,
      required this.distances})
      : super._();

  factory _$RaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RaceModelImplFromJson(json);

  @override
  final String name;
  @override
  final String? organizer;
  @override
  final String date;
  @override
  final String country;
  @override
  final String city;
  @override
  final String image;
  @override
  final String type;
  @override
  final String distances;

  @override
  String toString() {
    return 'RaceModel(name: $name, organizer: $organizer, date: $date, country: $country, city: $city, image: $image, type: $type, distances: $distances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RaceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organizer, organizer) ||
                other.organizer == organizer) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.distances, distances) ||
                other.distances == distances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, organizer, date, country,
      city, image, type, distances);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RaceModelImplCopyWith<_$RaceModelImpl> get copyWith =>
      __$$RaceModelImplCopyWithImpl<_$RaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RaceModelImplToJson(
      this,
    );
  }
}

abstract class _RaceModel extends RaceModel {
  const factory _RaceModel(
      {required final String name,
      final String? organizer,
      required final String date,
      required final String country,
      required final String city,
      required final String image,
      required final String type,
      required final String distances}) = _$RaceModelImpl;
  const _RaceModel._() : super._();

  factory _RaceModel.fromJson(Map<String, dynamic> json) =
      _$RaceModelImpl.fromJson;

  @override
  String get name;
  @override
  String? get organizer;
  @override
  String get date;
  @override
  String get country;
  @override
  String get city;
  @override
  String get image;
  @override
  String get type;
  @override
  String get distances;
  @override
  @JsonKey(ignore: true)
  _$$RaceModelImplCopyWith<_$RaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
