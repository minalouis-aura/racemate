import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/constants/dimensions.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class LocationFilter extends ConsumerStatefulWidget {
  const LocationFilter({super.key});

  @override
  ConsumerState createState() => _LocationFilterState();
}

class _LocationFilterState extends ConsumerState<LocationFilter> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Text('race location'.toUpperCase(), style: 22.0.boldStyle.copyWith(color: '#000A35'.color),),
          16.0.vSpace,
          Padding(
            padding: kHorizontalScreenPadding.hPadding,
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: 8.0.allCircularBorder,
                    borderSide: BorderSide(color: '#CDD3E4'.color, width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: 8.0.allCircularBorder,
                    borderSide: BorderSide(color: '#CDD3E4'.color, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: 8.0.allCircularBorder,
                    borderSide: BorderSide(color: '#CDD3E4'.color, width: 2.0)),
              ),
              onChanged: (_){
                setState(() {

                });
              },
            ),
          ),
          34.5.vSpace,
          ...ref
            .read(raceServiceProvider)
            .locations
            .keys.where((element) => element.toLowerCase().contains(_searchController.text.toLowerCase()))
            .map((e) => CheckboxListTile(
                  value: ref.read(raceServiceProvider).locations[e],
                  title: Text(e),
                  onChanged: (value) {
                    setState(() {
                      ref.read(raceServiceProvider).locations[e] = value!;
                    });
                  },
                )),
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
                  ref.read(raceServiceProvider).useLocation = true;
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
