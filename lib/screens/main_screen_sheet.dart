import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/sheets/5e_sheet.dart';
import 'package:dicecord_mobile/sheets/pf2e_sheet.dart';
import 'package:flutter/material.dart';

class MainScreenSheet extends StatefulWidget {
  @override
  _MainScreenSheetState createState() => _MainScreenSheetState();
}

class _MainScreenSheetState extends State<MainScreenSheet> {

  Widget getSheet(ArgSetSheet args) {
    switch(args.diceType) {
      case "D&D 5th Edition":
        return DND5ESheet(
          gameName: args.gameName,
          character: args.character,
        );

      case "Pathfinder 2nd Edition":
        return PF2ESheet(
          gameName: args.gameName,
          character: args.character,
        );
    }
  }

  List<BottomNavigationBarItem> getTabs() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "Character"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: "Saving Throws"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: "Skills"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: "Features"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: "Attacks"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: "Spells"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;
    final List<BottomNavigationBarItem> tabs = getTabs();

    return getSheet(args);
  }
}