import 'dart:math';

import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/generic_methods.dart';
import 'package:flutter/material.dart';

class FeatureTile5e extends StatefulWidget {
  const FeatureTile5e({Key key, this.feature, this.args, this.character}) : super(key: key);
  final Feature5e feature;
  final ArgSetSheet args;
  final Character5e character;

  @override
  _FeatureTile5eState createState() => _FeatureTile5eState();
}

class _FeatureTile5eState extends State<FeatureTile5e> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      InkWell(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  widget.feature.name,
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                    fontSize: 20.0
                  ),
                ),
                Text(
                  widget.feature.source,
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                    fontStyle: FontStyle.italic
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          color: Color.fromARGB(235, 31, 40, 60),
        ),
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        onLongPress: () {
          String header = '${widget.character.characterName} used ${widget.feature.name}:';

          List fields = [
            {
              "name": "Description",
              "value": widget.feature.description
            },
            {
              "name": "Source",
              "value": widget.feature.source
            }
          ];

          GenericMethods.buildAndPushPayload(header, fields, widget.args.webhookURL);
        }
      ),
    ];

    if (expanded) {
      children.add(Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.feature.description,
            style: TextStyle(
              color: Color.fromARGB(255, 181, 206, 214),
            ),
          ),
        ),
        color: Color.fromARGB(40, 11, 20, 70),
        width: 400,
      ));
    }

    return Column(
      children: children,
    );
  }
}
