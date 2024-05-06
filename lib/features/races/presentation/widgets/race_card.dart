import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:racemate/constants/dimensions.dart';
import 'package:racemate/constants/icons.dart';
import 'package:racemate/features/races/domain/race.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class RaceCard extends StatelessWidget {
  final RaceModel race;
  const RaceCard({super.key, required this.race});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 210.0, minHeight: 153.0),
      margin: EdgeInsets.only(left: kHorizontalScreenPadding, right: kHorizontalScreenPadding, bottom: kVerticalScreenPadding),
      decoration: BoxDecoration(
        color: '#F1F4FD'.color,
        borderRadius: 8.0.allCircularBorder,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 4.0),
            color: '#0000004D'.color.withOpacity(0.3),
            blurRadius: 10.0
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: 8.0.hStartCircularBorder,
              child: Image.asset('assets/races_images/${race.image}', fit: BoxFit.cover,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0, top: 6.0, bottom: 12.50, end: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(race.name, style: 16.0.thickStyle.copyWith(color: '#000A35'.color),),
                  if(race.organizer != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        4.0.vSpace,
                        Text('Organized by', style: 14.0.mediumStyle.copyWith(color: '#8E9BC3'.color),),
                        Text(race.organizer!, style: 14.0.mediumStyle.copyWith(color: '#F77F00'.color),),
                      ],
                    ),
                  8.0.vSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset(CustomIcons.distance, width: 16.0, height: 16.0,),
                                4.0.hSpace,
                                Text(race.distances),
                              ],
                            ),
                            5.0.vSpace,
                            Row(
                              children: [
                                Image.asset(CustomIcons.calender, width: 16.0, height: 16.0,),
                                4.0.hSpace,
                                Text(DateFormat.yMMMd().format(DateTime.parse(race.date))),
                              ],
                            ),
                            5.0.vSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(CustomIcons.location, width: 16.0, height: 16.0,),
                                4.0.hSpace,
                                Flexible(child: Text('${race.city}, ${race.country}')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(CustomIcons.share, width: 30.0, height: 30.0,),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
