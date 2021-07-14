import 'dart:math';

import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/spell_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/generic_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SpellTile5e extends StatefulWidget {
  const SpellTile5e({Key key, this.spell, this.args, this.character}) : super(key: key);
  final Spell5e spell;
  final ArgSetSheet args;
  final Character5e character;

  @override
  _SpellTile5eState createState() => _SpellTile5eState();
}

class _SpellTile5eState extends State<SpellTile5e> {
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
                    widget.spell.name,
                    style: TextStyle(
                        color: Color.fromARGB(255, 221, 246, 254),
                        fontSize: 20.0
                    ),
                  ),
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
            String header = '${widget.character.characterName} used ${widget.spell.name}:';

            List fields = [
              {
                "name": "Description",
                "value": widget.spell.spellDescription
              },
              {
                "name": "Spell Level",
                "value": widget.spell.spellLevel
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
              widget.spell.spellDescription,
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