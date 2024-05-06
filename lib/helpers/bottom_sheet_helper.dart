import 'package:flutter/material.dart';
import 'package:racemate/utilities/extensions/num.dart';
import 'package:racemate/utilities/extensions/string.dart';

class BottomSheetHelper{
  static Future gShowModalBottomSheet({required BuildContext context, required Widget content, bool isDismissible = true}) async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: isDismissible,
      context: context,
      backgroundColor: Colors.white,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: 8.0.vTopCircularBorder,
      ),
      builder: (BuildContext context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: 8.0.vTopCircularBorder,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 3.0,
                  width: 80.0,
                  margin: const EdgeInsets.only(top: 11.0),
                  decoration: BoxDecoration(
                      color: '#CDD3E4'.color,
                      borderRadius: 4.0.allCircularBorder),
                ),
                const SizedBox(height: 22.0),
                Flexible(
                  child: content,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}