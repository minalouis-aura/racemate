import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/features/races/domain/race.dart';
import 'package:collection/collection.dart';

class RaceService{
  final Ref ref;

  RaceService({required this.ref});

  List<Locations> locations = [];
  String? typeFilter;
  RangeValues distanceRange = const RangeValues(0, 200);
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();

  bool useType = false, useDistance = false, useDate = false, useLocation = false;

  int filtersCount(){
    int filtersCount = 0;
    if(useType){
      filtersCount++;
    }
    if(useDistance){
      filtersCount++;
    }
    if(useDate){
      filtersCount++;
    }
    if(useLocation){
      filtersCount++;
    }
    return filtersCount;
  }

  void resetFilters(){
    useType = false;
    useDistance = false;
    useLocation = false;
    useDate = false;
    from = DateTime.now();
    to = DateTime.now();
    distanceRange = const RangeValues(0, 200);
    typeFilter = null;
    for (var element in locations) {
      element.value = false;
    }
  }

  void getLocationsFilterData(List<RaceModel> races){
    if(locations.isEmpty) {
      Map<String, List> countryOccurrences = groupBy(races, (obj) => obj.country);
      for (RaceModel e in races) {
        if(!locations.any((element) => element.key == e.country)) {
          locations.add(Locations(e.country, '${e.country} (${countryOccurrences[e.country]?.length ?? 0})', false));
        }
      }}
  }
}

final raceServiceProvider = Provider((ref) => RaceService(ref: ref));

class Locations{
  final String key;
  final String label;
  bool value;

  Locations(this.key, this.label, this.value);
}