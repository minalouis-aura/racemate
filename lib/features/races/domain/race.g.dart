// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RaceModelImpl _$$RaceModelImplFromJson(Map<String, dynamic> json) =>
    _$RaceModelImpl(
      name: json['name'] as String,
      organizer: json['organizer'] as String?,
      date: json['date'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      distances: json['distances'] as String,
    );

Map<String, dynamic> _$$RaceModelImplToJson(_$RaceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'organizer': instance.organizer,
      'date': instance.date,
      'country': instance.country,
      'city': instance.city,
      'image': instance.image,
      'type': instance.type,
      'distances': instance.distances,
    };
