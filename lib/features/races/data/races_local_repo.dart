import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RacesLocalRepository{
  Future<List> getRaces(BuildContext context) async {
    try{
      String data = await DefaultAssetBundle.of(context).loadString("assets/races_data.json");
      return jsonDecode(data);
    }catch(_){
      rethrow;
    }
  }
}

final racesLocalRepoProvider = Provider((ref) => RacesLocalRepository());