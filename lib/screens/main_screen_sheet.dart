import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/sheets/5e_sheet.dart';
import 'package:flutter/material.dart';

class MainScreenSheet extends StatefulWidget {
  @override
  _MainScreenSheetState createState() => _MainScreenSheetState();
}

class _MainScreenSheetState extends State<MainScreenSheet> {

  Widget getSheet(ArgSetSheet args) {
    return DND5ESheet(
      gameName: args.gameName,
      character: args.character,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.gameName),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Standard Dice
              SizedBox(
                height: 20.0,
              ),
              getSheet(args),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        )
    );
  }
}