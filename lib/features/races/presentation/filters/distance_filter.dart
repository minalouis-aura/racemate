import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class DistanceFilter extends ConsumerStatefulWidget {
  const DistanceFilter({super.key});

  @override
  ConsumerState createState() => _DistanceFilterState();
}

class _DistanceFilterState extends ConsumerState<DistanceFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Spacer(),
              Expanded(
                  flex: 3, child: Text('race distance'.toUpperCase(), style: 22.0.boldStyle.copyWith(color: '#000A35'.color), textAlign: TextAlign.center,)),
              Expanded(child: GestureDetector(onTap: (){
                setState(() {
                  ref.read(raceServiceProvider).distanceRange = const RangeValues(0.0, 200.0);
                });
              }, child: Text('reset'.toUpperCase(), style: 14.0.boldStyle.copyWith(color: '#BD5000'.color),)),),
            ],
          ),
          16.0.vSpace,
          RangeSlider(
            values: ref.watch(raceServiceProvider).distanceRange,
            max: 200.0,
            divisions: 200,
            labels: RangeLabels(
              ref.read(raceServiceProvider).distanceRange.start.round().toString(),
              ref.read(raceServiceProvider).distanceRange.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                ref.read(raceServiceProvider).distanceRange = values;
              });
            },
          ),
          16.0.vSpace,
          Padding(
            padding: 16.0.hPadding,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: '#FFB715'.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: 8.0.allCircularBorder,
                  ),
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width)
              ),
              onPressed: () {

                setState(() {
                  ref.read(raceServiceProvider).useDistance = true;
                  Navigator.pop(context);
                });
              },
              child: Text('Done', style: 14.0.boldStyle.copyWith(color: '#1C325F'.color),),
            ),
          ),
        ],
      ),
    );
  }
}
