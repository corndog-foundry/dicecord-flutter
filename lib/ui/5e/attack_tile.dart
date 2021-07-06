import 'dart:math';

import 'package:dicecord_mobile/data_classes/5e/attack_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/generic_methods.dart';
import 'package:dicecord_mobile/methods/methods_5e.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AttackTile5e extends StatefulWidget {
  const AttackTile5e({Key key, this.attack, this.args, this.character}) : super(key: key);
  final Attack5e attack;
  final ArgSetSheet args;
  final Character5e character;

  @override
  _AttackTile5eState createState() => _AttackTile5eState();
}

class _AttackTile5eState extends State<AttackTile5e> {
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
                    widget.attack.name,
                    style: TextStyle(
                        color: Color.fromARGB(255, 221, 246, 254),
                        fontSize: 20.0
                    ),
                  ),
                  Text(
                    widget.attack.attackBonus > 0 ? 'To Hit: +${widget.attack.attackBonus.abs()}' : 'To Hit: -${widget.attack.attackBonus.abs()}',
                    style: TextStyle(
                        color: Color.fromARGB(255, 221, 246, 254),
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    widget.attack.damageBonus > 0 ? '${widget.attack.nDamageDice}d${widget.attack.damageDiceType} + ${widget.attack.damageBonus.abs()} ${widget.attack.damageType}' : '${widget.attack.nDamageDice}${widget.attack.damageDiceType} - ${widget.attack.damageBonus.abs()} ${widget.attack.damageType}',
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
            Methods5e.rollCheck(
                widget.attack.attackBonus,
                widget.character.characterName,
                "${widget.attack.name} Attack",
                widget.args
            );

            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Hit?"),
                    content: Text("Did the attack hit?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("NO")
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);

                            Methods5e.rollDamage(widget.attack, widget.character.characterName, widget.args);
                          },
                          child: Text("YES")
                      ),
                    ],
                  );
                }
            );
          },
        onLongPress: () {
            Methods5e.doubleRoll(
                widget.attack.attackBonus,
                widget.character.characterName,
                "${widget.attack.name} Attack",
                widget.args
            );
        },
      ),
    ];

    return Column(
      children: children,
    );
  }
}