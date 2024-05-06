import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:racemate/features/races/application/race_service.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class DateFilter extends ConsumerStatefulWidget {
  const DateFilter({super.key});

  @override
  ConsumerState createState() => _DateFilterState();
}

class _DateFilterState extends ConsumerState<DateFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Spacer(),
              Expanded(
                  flex: 3, child: Text('race date'.toUpperCase(), style: 22.0.boldStyle.copyWith(color: '#000A35'.color), textAlign: TextAlign.center,)),
              Expanded(child: GestureDetector(onTap: (){
                setState(() {
                  ref.read(raceServiceProvider).from = DateTime.now();
                  ref.read(raceServiceProvider).to = DateTime.now();
                });
              }, child: Text('reset'.toUpperCase(), style: 14.0.boldStyle.copyWith(color: '#BD5000'.color),)),),
            ],
          ),
          16.0.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('from'.toUpperCase(), style: 16.0.regularStyle.copyWith(color: '#1C325F'.color),),
          ),
          4.0.vSpace,
          GestureDetector(
            onTap: () async {
              final date = await showDatePickerDialog(
                  context: context,
                  minDate: DateTime.now(),
                  maxDate: DateTime.now().add(const Duration(days: 3 * 365)),
                  initialDate: DateTime.now(),
                  selectedDate: ref.watch(raceServiceProvider).from,
                  centerLeadingDate: true,
                  selectedCellDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(bottom: BorderSide(color: '#F77F00'.color, width: 2.0))
                  ),
                  slidersColor: '#F77F00'.color,
                  daysOfTheWeekTextStyle: 14.0.boldStyle.copyWith(color: '#000A35'.color),
                  enabledCellsTextStyle: 14.0.mediumStyle.copyWith(color: '#000A35'.color),
                  disabledCellsTextStyle: 14.0.mediumStyle.copyWith(color: Colors.grey),
                  currentDateTextStyle: 14.0.mediumStyle,
                  selectedCellTextStyle: 14.0.mediumStyle.copyWith(color: '#000A35'.color),
                  leadingDateTextStyle: 18.0.mediumStyle.copyWith(color: '#1C325F'.color)
              );
              if(date != null){
                setState(() {
                  ref.read(raceServiceProvider).from = date;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: 8.0.allCircularBorder,
                border: Border.all(color: '#F77F00'.color),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_month),
                  4.0.hSpace,
                  Text(DateFormat.yMMMEd().format(ref.watch(raceServiceProvider).from)),
                ],
              ),
            ),
          ),
          21.0.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('to'.toUpperCase(), style: 16.0.regularStyle.copyWith(color: '#1C325F'.color),),
          ),
          4.0.vSpace,
          GestureDetector(
            onTap: () async {
              final date = await showDatePickerDialog(
                context: context,
                minDate: ref.watch(raceServiceProvider).from.add(const Duration(days: 1)),
                maxDate: DateTime.now().add(const Duration(days: 3 * 365)),
                initialDate: ref.watch(raceServiceProvider).from.add(const Duration(days: 1)),
                selectedDate: ref.watch(raceServiceProvider).to,
                centerLeadingDate: true,
                selectedCellDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(bottom: BorderSide(color: '#F77F00'.color, width: 2.0))
                ),
                slidersColor: '#F77F00'.color,
                daysOfTheWeekTextStyle: 14.0.boldStyle.copyWith(color: '#000A35'.color),
                enabledCellsTextStyle: 14.0.mediumStyle.copyWith(color: '#000A35'.color),
                disabledCellsTextStyle: 14.0.mediumStyle.copyWith(color: Colors.grey),
                currentDateTextStyle: 14.0.mediumStyle,
                selectedCellTextStyle: 14.0.mediumStyle.copyWith(color: '#000A35'.color),
                leadingDateTextStyle: 18.0.mediumStyle.copyWith(color: '#1C325F'.color)
              );
              if(date != null){
                setState(() {
                  ref.read(raceServiceProvider).to = date;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: 8.0.allCircularBorder,
                border: Border.all(color: '#F77F00'.color),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_month),
                  4.0.hSpace,
                  Text(DateFormat.yMMMEd().format(ref.watch(raceServiceProvider).to)),
                ],
              ),
            ),
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
                  ref.read(raceServiceProvider).useDate = true;
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
