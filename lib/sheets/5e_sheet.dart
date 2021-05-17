import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/methods_5e.dart';
import 'package:dicecord_mobile/ui/5e/feature_tile.dart';
import 'package:flutter/material.dart';

class DND5ESheet extends StatefulWidget {
  final String gameName;
  final Character5e character;
  const DND5ESheet({Key key, this.gameName, this.character}) : super(key: key);

  @override
  _DND5ESheetState createState() => _DND5ESheetState();
}

class _DND5ESheetState extends State<DND5ESheet> {

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

    Character5e character = widget.character;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [
            SizedBox(height: 20.0,),
            SingleChildScrollView(
              child: Column(
                children: [
                  // Character Details
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
                        "RACE:",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromARGB(255, 188, 246, 254),
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      Text(
                        character.characterRace,
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

                  // Ability Scores and Modifiers
                  Text(
                    "Ability Scores & Modifiers",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                    ),
                  ),
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
                  SizedBox(height: 10.0,),
                  Divider(
                    thickness: 5.0,
                  ),
                  SizedBox(height: 10.0,),

                  // Saving Throws
                  Text(
                    "Saving Throws",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      children: [
                        TableRow(
                            children: [
                              Center(child: Text("Saving Throw", style: TextStyle(fontWeight: FontWeight.bold))),
                              Center(child: Text("Proficient?", style: TextStyle(fontWeight: FontWeight.bold))),
                              Center(child: Text("Bonus", style: TextStyle(fontWeight: FontWeight.bold))),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.strengthSavingThrowProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel), character.characterName, "Strength Saving Throw", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.strengthSavingThrowProficiency, character.characterLevel), character.characterName, "Strength Saving Throw", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.dexteritySavingThrowProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.dexteritySavingThrowProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.dexteritySavingThrowProficiency, character.characterLevel), character.characterName, "Dexterity Saving Throw", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.dexteritySavingThrowProficiency, character.characterLevel), character.characterName, "Dexterity Saving Throw", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.constitutionSavingThrowProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.constitutionScore), character.constitutionSavingThrowProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.constitutionScore), character.constitutionSavingThrowProficiency, character.characterLevel), character.characterName, "Constitution Saving Throw", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.constitutionScore), character.constitutionSavingThrowProficiency, character.characterLevel), character.characterName, "Constitution Saving Throw", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.intelligenceSavingThrowProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.intelligenceSavingThrowProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.intelligenceSavingThrowProficiency, character.characterLevel), character.characterName, "Intelligence Saving Throw", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.intelligenceSavingThrowProficiency, character.characterLevel), character.characterName, "Intelligence Saving Throw", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.wisdomSavingThrowProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.wisdomSavingThrowProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.wisdomSavingThrowProficiency, character.characterLevel), character.characterName, "Wisdom Saving Throw", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.wisdomSavingThrowProficiency, character.characterLevel), character.characterName, "Wisdom Saving Throw", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.charismaSavingThrowProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.charismaSavingThrowProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.charismaSavingThrowProficiency, character.characterLevel), character.characterName, "Charisma Saving Throw", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.charismaSavingThrowProficiency, character.characterLevel), character.characterName, "Charisma Saving Throw", args),
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

                  // Skills
                  Text(
                    "Skills",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      children: [
                        TableRow(
                            children: [
                              Center(child: Text("Skill", style: TextStyle(fontWeight: FontWeight.bold))),
                              Center(child: Text("Proficient?", style: TextStyle(fontWeight: FontWeight.bold))),
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
                                child: Center(child: Text("Animal Handling", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.animalHandlingProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.animalHandlingProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.animalHandlingProficiency, character.characterLevel), character.characterName, "Animal Handling Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.animalHandlingProficiency, character.characterLevel), character.characterName, "Animal Handling Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.arcanaProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.arcanaProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.arcanaProficiency, character.characterLevel), character.characterName, "Arcana Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.arcanaProficiency, character.characterLevel), character.characterName, "Arcana Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.athleticsProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.athleticsProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.athleticsProficiency, character.characterLevel), character.characterName, "Athletics Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.strengthScore), character.athleticsProficiency, character.characterLevel), character.characterName, "Athletics Check", args),
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
                                child: Center(child: Text("History", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.historyProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.historyProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.historyProficiency, character.characterLevel), character.characterName, "History Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.historyProficiency, character.characterLevel), character.characterName, "History Check", args),
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
                                child: Center(child: Text("Insight", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.insightProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.insightProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.insightProficiency, character.characterLevel), character.characterName, "Insight Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.insightProficiency, character.characterLevel), character.characterName, "Insight Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.intimidationProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.intimidationProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.intimidationProficiency, character.characterLevel), character.characterName, "Intimidation Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.intimidationProficiency, character.characterLevel), character.characterName, "Intimidation Check", args),
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
                                child: Center(child: Text("Investigation", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.investigationProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.investigationProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.investigationProficiency, character.characterLevel), character.characterName, "Investigation Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.investigationProficiency, character.characterLevel), character.characterName, "Investigation Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.medicineProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.medicineProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.medicineProficiency, character.characterLevel), character.characterName, "Medicine Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.medicineProficiency, character.characterLevel), character.characterName, "Medicine Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.natureProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.natureProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.natureProficiency, character.characterLevel), character.characterName, "Nature Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.natureProficiency, character.characterLevel), character.characterName, "Nature Check", args),
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
                                child: Center(child: Text("Perception", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.perceptionProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.perceptionProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.perceptionProficiency, character.characterLevel), character.characterName, "Perception Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.perceptionProficiency, character.characterLevel), character.characterName, "Perception Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.performanceProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.performanceProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.performanceProficiency, character.characterLevel), character.characterName, "Performance Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.performanceProficiency, character.characterLevel), character.characterName, "Performance Check", args),
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
                                child: Center(child: Text("Persuasion", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.persuasionProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.persuasionProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.persuasionProficiency, character.characterLevel), character.characterName, "Persuasion Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.charismaScore), character.persuasionProficiency, character.characterLevel), character.characterName, "Persuasion Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.religionProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.religionProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.religionProficiency, character.characterLevel), character.characterName, "Religion Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.intelligenceScore), character.religionProficiency, character.characterLevel), character.characterName, "Religion Check", args),
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
                                child: Center(child: Text("Sleight of Hand", style: TextStyle(color: Color.fromARGB(255, 188, 246, 254)),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                                child: Center(child: Methods5e.getProficiencyIcon(character.sleightOfHandProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.sleightOfHandProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.sleightOfHandProficiency, character.characterLevel), character.characterName, "Sleight of Hand Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.sleightOfHandProficiency, character.characterLevel), character.characterName, "Sleight of Hand Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.stealthProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.stealthProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.stealthProficiency, character.characterLevel), character.characterName, "Stealth Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.dexterityScore), character.stealthProficiency, character.characterLevel), character.characterName, "Stealth Check", args),
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
                                child: Center(child: Methods5e.getProficiencyIcon(character.survivalProficiency)),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Text(Methods5e.formatBonus(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.survivalProficiency, character.characterLevel)).toString()),
                                  onPressed: () => Methods5e.rollCheck(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.survivalProficiency, character.characterLevel), character.characterName, "Survival Check", args),
                                  onLongPress: () => Methods5e.doubleRoll(Methods5e.calculateProficiency(Methods5e.getModifier(character.wisdomScore), character.survivalProficiency, character.characterLevel), character.characterName, "Survival Check", args),
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

                  // Features
                  Text(
                    "Features",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                    ),
                  ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ]
      ),
    );
  }
}


