import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class TypeFilter extends ConsumerStatefulWidget {
  const TypeFilter({super.key});

  @override
  ConsumerState createState() => _TypeFilterState();
}

class _TypeFilterState extends ConsumerState<TypeFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('race type'.toUpperCase(), style: 22.0.boldStyle.copyWith(color: '#000A35'.color),),
          16.0.vSpace,
          RadioListTile(
            value: 'Real-time',
            title: Text('Real-time event'),
            groupValue: ref.watch(raceServiceProvider).typeFilter,
            onChanged: (value) {
              setState(() {
                ref.read(raceServiceProvider).typeFilter = value!;
              });
            },
            controlAffinity:
            ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: 'Virtual',
            title: Text('Virtual'),
            groupValue: ref.watch(raceServiceProvider).typeFilter,
            onChanged: (value) {
              setState(() {
                ref.read(raceServiceProvider).typeFilter = value!;
              });
            },
            controlAffinity:
            ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: 'All',
            title: Text('All'),
            groupValue: ref.watch(raceServiceProvider).typeFilter,
            onChanged: (value) {
              setState(() {
                ref.read(raceServiceProvider).typeFilter = value!;
              });
            },
            controlAffinity:
            ListTileControlAffinity.trailing,
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
                  ref.read(raceServiceProvider).useType = true;
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
