import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/data_classes/pf2e/character_pf2e.dart';
import 'package:dicecord_mobile/methods/methods_5e.dart';
import 'package:dicecord_mobile/ui/5e/attack_tile.dart';
import 'package:dicecord_mobile/ui/5e/feature_tile.dart';
import 'package:dicecord_mobile/ui/5e/spell_level_display.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PF2ESheet extends StatefulWidget {
  final String gameName;
  final CharacterPF2e character;
  const PF2ESheet({Key key, this.gameName, this.character}) : super(key: key);

  @override
  _PF2ESheetState createState() => _PF2ESheetState();
}

class _PF2ESheetState extends State<PF2ESheet> {
  int currentTab = 0;
  int deathSaveFails = 0;
  int deathSavePasses = 0;
  bool stable = false;

  List<Icon> getDeathSaveFailIcons () {
    List<Icon> deathSaveFailIcons = [];

    for (var i = 0; i < 3; i++) {
      if (i < deathSaveFails) {
        deathSaveFailIcons.add(Icon(Icons.circle, size: 40.0));
      } else {
        deathSaveFailIcons.add(Icon(Icons.circle_outlined, size: 40.0));
      }
    }

    return deathSaveFailIcons;
  }

  List<Icon> getDeathSavePassIcons () {
    List<Icon> deathSavePassIcons = [];

    for (var i = 0; i < 3; i++) {
      if (i < deathSavePasses) {
        deathSavePassIcons.add(Icon(Icons.circle, size: 40.0));
      } else {
        deathSavePassIcons.add(Icon(Icons.circle_outlined, size: 40.0));
      }
    }

    return deathSavePassIcons;
  }

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

    CharacterPF2e character = widget.character;

    List<BottomNavigationBarItem> tabs = [
      BottomNavigationBarItem(
          icon: Icon(LineIcons.user),
          label: "Character"
      ),
      BottomNavigationBarItem(
          icon: Icon(LineIcons.dice),
          label: "Saves"
      ),
      BottomNavigationBarItem(
          icon: Icon(LineIcons.diceD20),
          label: "Skills"
      ),
      BottomNavigationBarItem(
          icon: Icon(LineIcons.dungeon),
          label: "Feats"
      ),
      BottomNavigationBarItem(
          icon: Icon(LineIcons.raisedFist),
          label: "Attacks"
      ),
      BottomNavigationBarItem(
          icon: Icon(LineIcons.scroll),
          label: "Spells"
      ),
    ];

    List<Widget> tabContents = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "NAME:",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 188, 246, 254),
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    character.characterName,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color.fromARGB(255, 188, 246, 254)
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Text(
                    "ANCESTRY:",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 188, 246, 254),
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    character.characterAncestry,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 188, 246, 254)
                    ),
                  ),
                  Text(
                    "CLASS:",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 188, 246, 254),
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    character.characterClass,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 188, 246, 254)
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Text(
                    "BACKGROUND:",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 188, 246, 254),
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    character.characterBackground,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 188, 246, 254)
                    ),
                  ),
                  Text(
                    "ALIGNMENT:",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 188, 246, 254),
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    character.characterAlignment,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 188, 246, 254)
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              SizedBox(height: 10.0,),
              MaterialButton(
                child: Text("Edit Character"),
                onPressed: () => Navigator.pushNamed(
                    context,
                    '/5e/editcharacter',
                    arguments: args
                ).then((value) => setState(() {
                  character = value;
                })),
                height: 28.0,
                minWidth: 84.0,
                color: Color.fromARGB(255, 221, 246, 254),
              ),
              SizedBox(height: 10.0,),
              Divider(
                thickness: 5.0,
              ),
              SizedBox(height: 10.0,),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: Key('currentHitPoints'),
                      initialValue: character.currentHitPoints.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Current Hit Points',

                      ),
                      onChanged: (newValue) {
                        setState(() {
                          deathSaveFails = 0;
                          deathSavePasses = 0;
                          stable = false;

                          int mHp = character.ancestryHitPoints + (character.characterLevel * character.classHitPoints)

                          character.currentHitPoints = int.parse(newValue);

                          if (character.currentHitPoints > mHp) {
                            character.currentHitPoints = mHp;
                          } else if (character.currentHitPoints < 0) {
                            character.currentHitPoints = 0;
                          }

                          Methods5e.updateSavedCharacter(args.gameName, character);
                        });
                      },
                      style: TextStyle(
                          color: Color.fromARGB(255, 221, 246, 254),
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 50.0,),
                  Text("/", style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 221, 246, 254),),),
                  SizedBox(width: 50.0,),
                  Text(character.maximumHitPoints.toString(), style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 221, 246, 254),),),
                  SizedBox(width: 50.0,),
                  Icon(LineIcons.heartAlt, size: 50.0, color: Color.fromARGB(255, 221, 246, 254),)
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),

              SizedBox(height: 10.0,),
              Divider(
                thickness: 5.0,
              ),
              SizedBox(height: 10.0,),

              Row(
                children: [
                  Icon(LineIcons.alternateShield, size: 50.0, color: Color.fromARGB(255, 221, 246, 254),),
                  Text(character.armorClass.toString(), style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 221, 246, 254),),),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),

              Visibility(
                  visible: character.currentHitPoints == 0 && !stable,
                  child: Column(
                    children: [
                      SizedBox(height: 20.0,),
                      MaterialButton(
                        child: Text("Roll Death Save"),
                        onPressed: () {
                          int result = Methods5e.rollDeathSave(character.characterName, args);

                          setState(() {
                            if (result < 10) {
                              deathSaveFails++;
                            } else if (result == 20) {
                              character.currentHitPoints = 1;
                              Methods5e.updateSavedCharacter(args.gameName, character);
                              deathSavePasses = 0;
                              deathSaveFails = 0;
                              Methods5e.sendMessage("${character.characterName} has restored 1 hit point.", args);
                            } else if (result == 1) {
                              deathSaveFails += 2;
                            } else {
                              deathSavePasses++;
                            }
                          });

                          if (deathSaveFails >= 3) {
                            Methods5e.sendMessage("${character.characterName} has died.", args);
                          }

                          if (deathSavePasses >= 3) {
                            Methods5e.sendMessage("${character.characterName} has stabilised.", args);
                            stable = true;
                          }
                        },
                        height: 28.0,
                        minWidth: 84.0,
                        color: Color.fromARGB(255, 221, 246, 254),
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Icon(LineIcons.skull, size: 40.0, ),
                          SizedBox(width: 25.0,),
                          Row(children: getDeathSaveFailIcons())
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Icon(LineIcons.heart, size: 40.0, ),
                          SizedBox(width: 25.0,),
                          Row(children: getDeathSavePassIcons())
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    ],
                  )
              ),

              SizedBox(height: 10.0,),
              Divider(
                thickness: 5.0,
              ),
              SizedBox(height: 10.0,),

              // Ability Scores and Modifiers
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          Center(child: Text("Ability", style: TextStyle(fontWeight: FontWeight.bold))),
                          Center(child: Text("Score", style: TextStyle(fontWeight: FontWeight.bold))),
                          Center(child: Text("Modifier", style: TextStyle(fontWeight: FontWeight.bold))),
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Strength", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text(character.strengthScore.toString(), style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.calculateModifier(character.strengthScore)),
                              onPressed: () => Methods5e.rollCheck(Methods5e.getModifier(character.strengthScore), character.characterName, "Strength Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.getModifier(character.strengthScore), character.characterName, "Strength Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Dexterity", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text(character.dexterityScore.toString(), style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.calculateModifier(character.dexterityScore)),
                              onPressed: () => Methods5e.rollCheck(Methods5e.getModifier(character.dexterityScore), character.characterName, "Dexterity Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.getModifier(character.dexterityScore), character.characterName, "Dexterity Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Constitution", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text(character.constitutionScore.toString(), style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.calculateModifier(character.constitutionScore)),
                              onPressed: () => Methods5e.rollCheck(Methods5e.getModifier(character.constitutionScore), character.characterName, "Constitution Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.getModifier(character.constitutionScore), character.characterName, "Constitution Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Intelligence", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text(character.intelligenceScore.toString(), style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.calculateModifier(character.intelligenceScore)),
                              onPressed: () => Methods5e.rollCheck(Methods5e.getModifier(character.intelligenceScore), character.characterName, "Intelligence Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.getModifier(character.intelligenceScore), character.characterName, "Intelligence Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Wisdom", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text(character.wisdomScore.toString(), style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.calculateModifier(character.wisdomScore)),
                              onPressed: () => Methods5e.rollCheck(Methods5e.getModifier(character.wisdomScore), character.characterName, "Wisdom Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.getModifier(character.wisdomScore), character.characterName, "Wisdom Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Charisma", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text(character.charismaScore.toString(), style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.calculateModifier(character.charismaScore)),
                              onPressed: () => Methods5e.rollCheck(Methods5e.getModifier(character.charismaScore), character.characterName, "Charisma Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.getModifier(character.charismaScore), character.characterName, "Charisma Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          Center(child: Text("Saving Throw", style: TextStyle(fontWeight: FontWeight.bold))),
                          Center(child: Text("Proficiency Level", style: TextStyle(fontWeight: FontWeight.bold))),
                          Center(child: Text("Bonus", style: TextStyle(fontWeight: FontWeight.bold))),
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Fortitude [FORT]", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.strengthSavingThrowProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel), character.characterName, "Fortitude Save", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel), character.characterName, "Fortitude Save", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Reflex [REF]", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.dexteritySavingThrowProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.dexteritySavingThrowProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.dexteritySavingThrowProficiency, character.characterLevel), character.characterName, "Reflex Save", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.dexteritySavingThrowProficiency, character.characterLevel), character.characterName, "Reflex Save", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Willpower [WILL]", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.constitutionSavingThrowProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.constitutionScore), character.constitutionSavingThrowProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.constitutionScore), character.constitutionSavingThrowProficiency, character.characterLevel), character.characterName, "Willpower Save", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.constitutionScore), character.constitutionSavingThrowProficiency, character.characterLevel), character.characterName, "Willpower Save", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                thickness: 5.0,
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Perception", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.strengthSavingThrowProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel), character.characterName, "Perception Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel), character.characterName, "Perception Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          Center(child: Text("Skill", style: TextStyle(fontWeight: FontWeight.bold))),
                          Center(child: Text("Proficiency Level", style: TextStyle(fontWeight: FontWeight.bold))),
                          Center(child: Text("Bonus", style: TextStyle(fontWeight: FontWeight.bold))),
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Acrobatics", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.acrobaticsProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.acrobaticsProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.acrobaticsProficiency, character.characterLevel), character.characterName, "Acrobatics Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.acrobaticsProficiency, character.characterLevel), character.characterName, "Acrobatics Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Arcana", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.animalHandlingProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.animalHandlingProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.animalHandlingProficiency, character.characterLevel), character.characterName, "Arcana Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.animalHandlingProficiency, character.characterLevel), character.characterName, "Arcana Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Athletics", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.arcanaProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.arcanaProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.arcanaProficiency, character.characterLevel), character.characterName, "Athletics Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.arcanaProficiency, character.characterLevel), character.characterName, "Athletics Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Crafting", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.athleticsProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.athleticsProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.athleticsProficiency, character.characterLevel), character.characterName, "Crafting Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.athleticsProficiency, character.characterLevel), character.characterName, "Crafting Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Deception", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.deceptionProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.deceptionProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.deceptionProficiency, character.characterLevel), character.characterName, "Deception Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.deceptionProficiency, character.characterLevel), character.characterName, "Deception Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Diplomacy", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.historyProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.historyProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.historyProficiency, character.characterLevel), character.characterName, "Diplomacy Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.historyProficiency, character.characterLevel), character.characterName, "Diplomacy Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Intimidation", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.insightProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.insightProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.insightProficiency, character.characterLevel), character.characterName, "Intimidation Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.insightProficiency, character.characterLevel), character.characterName, "Intimidation Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Medicine", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.intimidationProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.intimidationProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.intimidationProficiency, character.characterLevel), character.characterName, "Medicine Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.intimidationProficiency, character.characterLevel), character.characterName, "Medicine Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Nature", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.investigationProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.investigationProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.investigationProficiency, character.characterLevel), character.characterName, "Nature Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.investigationProficiency, character.characterLevel), character.characterName, "Nature Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Occultism", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.medicineProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.medicineProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.medicineProficiency, character.characterLevel), character.characterName, "Occultism Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.medicineProficiency, character.characterLevel), character.characterName, "Occultism Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Performance", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.natureProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.natureProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.natureProficiency, character.characterLevel), character.characterName, "Performance Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.natureProficiency, character.characterLevel), character.characterName, "Performance Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Religion", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.perceptionProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.perceptionProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.perceptionProficiency, character.characterLevel), character.characterName, "Religion Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.perceptionProficiency, character.characterLevel), character.characterName, "Religion Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Society", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.performanceProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.performanceProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.performanceProficiency, character.characterLevel), character.characterName, "Society Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.performanceProficiency, character.characterLevel), character.characterName, "Society Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Stealth", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.persuasionProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.persuasionProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.persuasionProficiency, character.characterLevel), character.characterName, "Stealth Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.persuasionProficiency, character.characterLevel), character.characterName, "Stealth Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Survival", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.religionProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.religionProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.religionProficiency, character.characterLevel), character.characterName, "Survival Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.religionProficiency, character.characterLevel), character.characterName, "Survival Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Text("Thievery", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                            child: Center(child: Methods5e.getProficiencyIcon(character.sleightOfHandProficiency)),
                          ),
                          Center(
                            child: MaterialButton(
                              child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.sleightOfHandProficiency, character.characterLevel)).toString()),
                              onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.sleightOfHandProficiency, character.characterLevel), character.characterName, "Thievery Check", args),
                              onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.sleightOfHandProficiency, character.characterLevel), character.characterName, "Thievery Check", args),
                              height: 24.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                child: Text("Add a Feature"),
                onPressed: () => Navigator.pushNamed(
                    context,
                    '/5e/addfeature',
                    arguments: args
                ).then((value) => setState(() {
                  character = value;
                })),
                height: 28.0,
                minWidth: 84.0,
                color: Color.fromARGB(255, 221, 246, 254),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: character.racialFeatures.length,
                  itemBuilder: (ctx, idx) {
                    return FeatureTile5e(
                      feature: character.racialFeatures[idx],
                      args: args,
                      character: character,
                    );
                  }
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: character.backgroundFeatures.length,
                  itemBuilder: (ctx, idx) {
                    return FeatureTile5e(
                      feature: character.backgroundFeatures[idx],
                      args: args,
                      character: character,
                    );
                  }
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: character.classFeatures.length,
                  itemBuilder: (ctx, idx) {
                    return FeatureTile5e(
                      feature: character.classFeatures[idx],
                      args: args,
                      character: character,
                    );
                  }
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: character.feats.length,
                  itemBuilder: (ctx, idx) {
                    return FeatureTile5e(
                      feature: character.feats[idx],
                      args: args,
                      character: character,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                child: Text("Add an Attack"),
                onPressed: () => Navigator.pushNamed(
                    context,
                    '/5e/addattack',
                    arguments: args
                ).then((value) => setState(() {
                  character = value;
                })),
                height: 28.0,
                minWidth: 84.0,
                color: Color.fromARGB(255, 221, 246, 254),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: character.attacks.length,
                  itemBuilder: (ctx, idx) {
                    return AttackTile5e(
                      args: args,
                      attack: character.attacks[idx],
                      character: character,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                child: Text("Add a Spell"),
                onPressed: () => Navigator.pushNamed(
                    context,
                    '/5e/addspell',
                    arguments: args
                ).then((value) => setState(() {
                  character = value;
                })),
                height: 28.0,
                minWidth: 84.0,
                color: Color.fromARGB(255, 221, 246, 254),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SpellLevelDisplay(
                      label: "Cantrips",
                      spells: character.spells.elementAt(0),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "First Level Spells",
                      spells: character.spells.elementAt(1),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Second Level Spells",
                      spells: character.spells.elementAt(2),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Third Level Spells",
                      spells: character.spells.elementAt(3),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Fourth Level Spells",
                      spells: character.spells.elementAt(4),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Fifth Level Spells",
                      spells: character.spells.elementAt(5),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Sixth Level Spells",
                      spells: character.spells.elementAt(6),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Seventh Level Spells",
                      spells: character.spells.elementAt(7),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                    SpellLevelDisplay(
                      label: "Eighth Level Spells",
                      spells: character.spells.elementAt(8),
                      args: args,
                      character: character,
                      numberSpells: 8,
                    ),
                    SpellLevelDisplay(
                      label: "Ninth Level Spells",
                      spells: character.spells.elementAt(9),
                      args: args,
                      character: character,
                      numberSpells: 5,
                    ),
                  ],
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(args.gameName),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    '/5e/custom',
                    arguments: args
                );
              },
              icon: Icon(LineIcons.diceD20))
        ],
      ),
      body: Center(
        child: tabContents.elementAt(currentTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        currentIndex: currentTab,
        onTap: (newTab) {
          setState(() {
            currentTab = newTab;
          });
        },
      ),
    );
  }
}