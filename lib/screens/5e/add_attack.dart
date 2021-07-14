import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/attack_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/methods_5e.dart';
import 'package:flutter/material.dart';

class AddAttack5e extends StatefulWidget {
  const AddAttack5e({Key key}) : super(key: key);

  @override
  _AddAttack5eState createState() => _AddAttack5eState();
}

class _AddAttack5eState extends State<AddAttack5e> {
  String attackName;
  int attackBonus = 0;
  int nDice = 0;
  int diceType = 4;
  int damageBonus = 0;
  String damageType = 'Acid';
  String traits;

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add an Attack"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Attack Name",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Attack Name',
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        attackName = newValue;
                      });
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Attack Roll",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("1d20"),
                      Text("+"),
                      SizedBox(
                        width: 75.0,
                        child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Bonus',
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                attackBonus = int.parse(newValue);
                              });
                            }
                        ),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Damage",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 75.0,
                        child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Dice',
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                nDice = int.parse(newValue);
                              });
                            }
                        ),
                      ),
                      DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text("d4"),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text("d6"),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text("d8"),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: Text("d10"),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: Text("d12"),
                              value: 12,
                            ),
                            DropdownMenuItem(
                              child: Text("d20"),
                              value: 20,
                            ),
                          ],
                        hint: Text("d$diceType", style: TextStyle(
                          color: Color.fromARGB(255, 221, 246, 254),
                        ),),
                        onChanged: (newValue) {
                            setState(() {
                              diceType = newValue;
                            });
                        },
                      ),
                      Text("+"),
                      SizedBox(
                        width: 75.0,
                        child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Bonus',
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                damageBonus = int.parse(newValue);
                              });
                            }
                        ),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Damage Type",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text("Acid"),
                      value: "Acid",
                    ),
                    DropdownMenuItem(
                      child: Text("Bludgeoning"),
                      value: "Bludgeoning",
                    ),
                    DropdownMenuItem(
                      child: Text("Cold"),
                      value: "Cold",
                    ),
                    DropdownMenuItem(
                      child: Text("Fire"),
                      value: "Fire",
                    ),
                    DropdownMenuItem(
                      child: Text("Force"),
                      value: "Force",
                    ),
                    DropdownMenuItem(
                      child: Text("Lightning"),
                      value: "Lightning",
                    ),
                    DropdownMenuItem(
                      child: Text("Necrotic"),
                      value: "Necrotic",
                    ),
                    DropdownMenuItem(
                      child: Text("Piercing"),
                      value: "Piercing",
                    ),
                    DropdownMenuItem(
                      child: Text("Poison"),
                      value: "Poison",
                    ),
                    DropdownMenuItem(
                      child: Text("Psychic"),
                      value: "Psychic",
                    ),
                    DropdownMenuItem(
                      child: Text("Radiant"),
                      value: "Radiant",
                    ),
                    DropdownMenuItem(
                      child: Text("Slashing"),
                      value: "Slashing",
                    ),
                    DropdownMenuItem(
                      child: Text("Thunder"),
                      value: "Thunder",
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      damageType = newValue;
                    });
                  },
                  hint: Text(damageType, style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Traits",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Traits',
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        traits = newValue;
                      });
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  child: Text("Add Attack"),
                  onPressed: () {
                    Attack5e newAttack = new Attack5e(
                      name: attackName,
                      attackBonus: attackBonus,
                      nDamageDice: nDice,
                      damageDiceType: diceType,
                      damageBonus: damageBonus,
                      damageType: damageType,
                      traits: traits
                    );

                    Character5e character = args.character;
                    character.addAttack(newAttack);

                    Methods5e.updateSavedCharacter(args.gameName, character);

                    Navigator.pop(context, character);
                  },
                  height: 46.0,
                  minWidth: 84.0,
                  color: Color.fromARGB(255, 221, 246, 254),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
