import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/constants/settings.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/features/races/data/races_local_repo.dart';
import 'package:racemate/features/races/domain/race.dart';

class RacesRepository {
  final Ref ref;

  RacesRepository({required this.ref});

  Future<List<RaceModel>> getRaces(BuildContext context, int pageKey) async {
    try {
      final List data = await ref.read(racesLocalRepoProvider).getRaces(context);
      List<RaceModel> races = data.map((e) => RaceModel.fromJson(e)).toList();
      int totalPages = races.length % kPageSize;
      ref.read(raceServiceProvider).getLocationsFilterData(races);
      if(ref.read(raceServiceProvider).useType){
        races = races.where((element) => element.type == ref.read(raceServiceProvider).typeFilter).toList();
      }
      if(ref.read(raceServiceProvider).useDate){
        races = races.where((element) => DateTime.parse(element.date).isAfter(ref.read(raceServiceProvider).from) && DateTime.parse(element.date).isBefore(ref.read(raceServiceProvider).to)).toList();
      }
      print(ref.read(raceServiceProvider).useLocation);
      if(ref.read(raceServiceProvider).useLocation){
        print('inside if condition');
        races.forEach((element) {
          print(element.country);
          print(ref.read(raceServiceProvider).locations.firstWhere((location) => location.key == element.country));
          print('______________________');
        });
        races = races.where((element) => ref.read(raceServiceProvider).locations.firstWhere((location) => location.key == element.country).value).toList();
      }
      if(ref.read(raceServiceProvider).useDistance){
        races = races.where((element) => element.distances.split(',').map((e) => double.parse(e)).toList().any((element) => element >= ref.read(raceServiceProvider).distanceRange.start && element <= ref.read(raceServiceProvider).distanceRange.end)).toList();
      }
      if(races.isEmpty){
        return [];
      }
      if(races.isNotEmpty && races.length < 10){
        return races.sublist(pageKey * kPageSize);
      }
      return races.sublist(pageKey * kPageSize, (pageKey + 1) * kPageSize);
    } catch (_) {
      rethrow;
    }
  }
}

final racesRepoProvider = Provider((ref) => RacesRepository(ref: ref));
