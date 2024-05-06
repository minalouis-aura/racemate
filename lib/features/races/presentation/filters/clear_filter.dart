import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class ClearFilters extends ConsumerStatefulWidget {
  const ClearFilters({super.key});

  @override
  ConsumerState createState() => _ClearFiltersState();
}

class _ClearFiltersState extends ConsumerState<ClearFilters> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Clear filters?'.toUpperCase(), style: 22.0.boldStyle.copyWith(color: '#000A35'.color), textAlign: TextAlign.center,),
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
                  ref.read(raceServiceProvider).resetFilters();
                  Navigator.pop(context);
                });
              },
              child: Text('Yes, clear filters'.toUpperCase(), style: 14.0.boldStyle.copyWith(color: '#1C325F'.color),),
            ),
          ),
          8.0.vSpace,
          Padding(
            padding: 16.0.hPadding,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: 8.0.allCircularBorder,
                    side: BorderSide(color: '#1C325F'.color)
                  ),
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width)
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'.toUpperCase(), style: 14.0.boldStyle.copyWith(color: '#1C325F'.color),),
            ),
          ),
        ],
      ),
    );
  }
}
