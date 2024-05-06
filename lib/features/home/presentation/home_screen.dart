import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/common/base_widgets/scaffold.dart';
import 'package:racemate/features/races/presentation/races_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      tabs: [
        Text('run'.toUpperCase()),
        Text('community'.toUpperCase()),
        Text('races'.toUpperCase()),
      ],
      tabBarItems: [
        Container(child: Center(child: Text('run'),),),
        Container(child: Center(child: Text('community'),),),
        RacesScreen(),
      ],
    );
  }
}
