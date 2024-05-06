import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class FilterAttribute extends ConsumerStatefulWidget {
  final String label;
  final void Function() onTap;
  const FilterAttribute({super.key, required this.label, required this.onTap});

  @override
  ConsumerState createState() => _FilterAttributeState();
}

class _FilterAttributeState extends ConsumerState<FilterAttribute> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: 8.0.allCircularBorder,
          border: Border.all(color: '#1C325F'.color),
        ),
        child: Row(
          children: [
            Text(widget.label, style: 15.0.mediumStyle.copyWith(color: '#1C325F'.color),),
            4.0.hSpace,
            Icon(Icons.keyboard_arrow_down, color: '#1C325F'.color,)
          ],
        ),
      ),
    );
  }
}
