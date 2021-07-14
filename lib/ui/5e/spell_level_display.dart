import 'dart:math';

import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/spell_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/ui/5e/spell_tile.dart';
import 'package:flutter/material.dart';

class SpellLevelDisplay extends StatefulWidget {
  const SpellLevelDisplay({Key key, this.spells, this.label, this.numberSpells, this.args, this.character}) : super(key: key);
  final List<dynamic> spells;
  final String label;
  final int numberSpells;
  final ArgSetSheet args;
  final Character5e character;

  @override
  _SpellLevelDisplayState createState() => _SpellLevelDisplayState();
}

class _SpellLevelDisplayState extends State<SpellLevelDisplay> {
  bool expanded = false;
  int spellsUsed = 0;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.spells.length > 0,
      child: Column(
        children: [
          InkWell(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                            color: Color.fromARGB(255, 221, 246, 254),
                            fontSize: 20.0
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                color: Color.fromARGB(235, 11, 20, 40),
              ),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              onLongPress: () {
                setState(() {
                  spellsUsed = 0;
                });
              }
          ),
          Visibility(
            visible: expanded,
            child: SizedBox(
              height: 175,
              child: ListView.builder(
                itemCount: widget.spells.length,
                itemBuilder: (ctx, idx) {
                  Spell5e spell = widget.spells.elementAt(idx) as Spell5e;

                  return SpellTile5e(
                    spell: spell,
                    args: widget.args,
                    character: widget.character,
                  );
                }
              ),
            ),
          )
        ],
      )
    );
  }
}
