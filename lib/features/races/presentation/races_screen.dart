import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:racemate/constants/dimensions.dart';
import 'package:racemate/constants/icons.dart';
import 'package:racemate/constants/settings.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/features/races/data/races_repo.dart';
import 'package:racemate/features/races/domain/race.dart';
import 'package:racemate/features/races/presentation/filters/clear_filter.dart';
import 'package:racemate/features/races/presentation/filters/date_filter.dart';
import 'package:racemate/features/races/presentation/filters/distance_filter.dart';
import 'package:racemate/features/races/presentation/filters/location_filter.dart';
import 'package:racemate/features/races/presentation/filters/type_filter.dart';
import 'package:racemate/features/races/presentation/widgets/filter_attribute.dart';
import 'package:racemate/features/races/presentation/widgets/race_card.dart';
import 'package:racemate/helpers/bottom_sheet_helper.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class RacesScreen extends ConsumerStatefulWidget {
  const RacesScreen({super.key});

  @override
  ConsumerState createState() => _RacesScreenState();
}

class _RacesScreenState extends ConsumerState<RacesScreen> {
  final PagingController<int, RaceModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(racesRepoProvider).getRaces(context, pageKey);
      final isLastPage = newItems.length < kPageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey++;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e, st) {
      print(e.toString());
      print(st.toString());
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kHorizontalScreenPadding.hPadding,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search Race Name or Country',
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
          ),
        ),
        16.0.vSpace,
        SizedBox(
          height: 43.0,
          child: Row(
            children: [
              if(ref.watch(raceServiceProvider).filtersCount() > 0)
                kHorizontalScreenPadding.hSpace,
              if(ref.watch(raceServiceProvider).filtersCount() > 0)
                GestureDetector(
                  onTap: () async {
                    BottomSheetHelper.gShowModalBottomSheet(context: context, content: const ClearFilters(),).then((value){
                      _pagingController.refresh();
                      _fetchPage(_pagingController.firstPageKey);
                      setState(() {});
                    });
                  },
                  child: Container(
                  height: 43.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: '#1C325F'.color,
                    borderRadius: 8.0.allCircularBorder,
                    border: Border.all(color: '#1C325F'.color),
                  ),
                  child: Row(
                    children: [
                      Image.asset(CustomIcons.filter, width: 18.0,),
                      4.0.hSpace,
                      Container(
                        height: 20.0,
                        width: 20.0,
                        alignment: Alignment.center,
                        padding: 0.0.allPadding,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: '#FFE954'.color
                        ),
                        child: Text(ref.watch(raceServiceProvider).filtersCount().toString(), style: 12.0.mediumStyle.copyWith(color: '#1C325F'.color),),
                      )
                    ],
                  ),
                                ),
                ),
              kHorizontalScreenPadding.hSpace,
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    FilterAttribute(
                        label: 'Type',
                        isEnabled: ref.watch(raceServiceProvider).useType,
                        onTap: () async {
                           BottomSheetHelper.gShowModalBottomSheet(context: context, content: const TypeFilter(),).then((value){
                             _pagingController.refresh();
                             _fetchPage(_pagingController.firstPageKey);
                             setState(() {});
                           });
                        }),
                    8.0.hSpace,
                    FilterAttribute(label: 'Location',
                        isEnabled: ref.watch(raceServiceProvider).useLocation,
                        onTap: () async {
                       BottomSheetHelper.gShowModalBottomSheet(context: context, content: const LocationFilter(),).then((value){
                         _pagingController.refresh();
                         _fetchPage(_pagingController.firstPageKey);
                         setState(() {});
                       });
                    }),
                    8.0.hSpace,
                    FilterAttribute(label: 'Distance',
                        isEnabled: ref.watch(raceServiceProvider).useDistance,
                        onTap: () async {
                       BottomSheetHelper.gShowModalBottomSheet(context: context, content: const DistanceFilter(),).then((value){
                         _pagingController.refresh();
                         _fetchPage(_pagingController.firstPageKey);
                         setState(() {});
                       });
                    }),
                    8.0.hSpace,
                    FilterAttribute(label: 'Date',
                        isEnabled: ref.watch(raceServiceProvider).useDate,
                        onTap: () async {
                       BottomSheetHelper.gShowModalBottomSheet(context: context, content: const DateFilter(),).then((value){
                         _pagingController.refresh();
                         _fetchPage(_pagingController.firstPageKey);
                         setState(() {});
                       });
                    }),
                    kHorizontalScreenPadding.hSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
        24.0.vSpace,
        Expanded(
          child: PagedListView<int, RaceModel>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<RaceModel>(
              itemBuilder: (context, item, index) => RaceCard(
                race: item,
              ),
            ),
          ),
        ),
      ],
    );

    //   Column(
    //   children: [
    //     RaceCard(race: RaceModel.fromJson({
    //       "name": "TCS New York City Marathon",
    //       "organizer": "New York Runners",
    //       "date": "20241103",
    //       "country": "United States of America",
    //       "city": "New York",
    //       "image": "newyork.jpg",
    //       "type": "Real-time",
    //       "distances": "21.1,42.2"
    //     }),),
    //   ],
    // );
  }
}
