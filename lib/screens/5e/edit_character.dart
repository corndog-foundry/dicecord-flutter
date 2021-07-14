import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditCharacter5e extends StatefulWidget {
  const EditCharacter5e({Key key}) : super(key: key);

  @override
  _EditCharacter5eState createState() => _EditCharacter5eState();
}

class _EditCharacter5eState extends State<EditCharacter5e> {
  int diceType = 0;

  // Character Details
  String newName = "";
  String newRace = "";
  String newClass = "";
  String newBackground = "";
  String newAlignment = "";
  int newLevel = 0;

  // Ability Scores
  int newStrength = 10;
  int newDexterity = 10;
  int newConstitution = 10;
  int newIntelligence = 10;
  int newWisdom = 10;
  int newCharisma = 10;

  String newStrengthSavingThrowProficiency = "Not Proficient";
  String newDexteritySavingThrowProficiency = "Not Proficient";
  String newConstitutionSavingThrowProficiency = "Not Proficient";
  String newIntelligenceSavingThrowProficiency = "Not Proficient";
  String newWisdomSavingThrowProficiency = "Not Proficient";
  String newCharismaSavingThrowProficiency = "Not Proficient";

  String newAcrobaticsProficiency = "Not Proficient";
  String newAnimalHandlingProficiency = "Not Proficient";
  String newArcanaProficiency = "Not Proficient";
  String newAthleticsProficiency = "Not Proficient";
  String newDeceptionProficiency = "Not Proficient";
  String newHistoryProficiency = "Not Proficient";
  String newInsightProficiency = "Not Proficient";
  String newIntimidationProficiency = "Not Proficient";
  String newInvestigationProficiency = "Not Proficient";
  String newMedicineProficiency = "Not Proficient";
  String newNatureProficiency = "Not Proficient";
  String newPerceptionProficiency = "Not Proficient";
  String newPerformanceProficiency = "Not Proficient";
  String newPersuasionProficiency = "Not Proficient";
  String newReligionProficiency = "Not Proficient";
  String newSleightOfHandProficiency = "Not Proficient";
  String newStealthProficiency = "Not Proficient";
  String newSurvivalProficiency = "Not Proficient";

  int newMaximumHitPoints = 0;
  int newArmorClass = 0;

  List<String> proficiencyLabels = [
    "Not Proficient",
    "Jack of All Trades",
    "Proficient",
    "Expertise"
  ];

  List<DropdownMenuItem> proficiencyValues = [
    DropdownMenuItem(
      child: Text("Not Proficient", style: TextStyle(
        color: Color.fromARGB(255, 221, 246, 254),
      ),),
      value: "Not Proficient",
    ),
    DropdownMenuItem(
      child: Text("Jack of All Trades", style: TextStyle(
        color: Color.fromARGB(255, 221, 246, 254),
      ),),
      value: "Jack of All Trades",
    ),
    DropdownMenuItem(
      child: Text("Proficient", style: TextStyle(
        color: Color.fromARGB(255, 221, 246, 254),
      ),),
      value: "Proficient",
    ),
    DropdownMenuItem(
      child: Text("Expertise", style: TextStyle(
        color: Color.fromARGB(255, 221, 246, 254),
      ),),
      value: "Expertise",
    ),
  ];

  int stage = 0;

  bool characterEditVisible = false;

  List<Widget> getPageContents () {
    switch(stage) {
      case 0:
        return [
          Text("Character Information", style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20.0),
          Text("Character Name", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('characterName'),
            initialValue: newName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Name',
            ),
            onChanged: (newValue) {
              setState(() {
                newName = newValue;
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          // Character Race
          Text("Character Race", style: TextStyle(
          color: Color.fromARGB(255, 221, 246, 254),
    ),),
          TextFormField(
            key: Key('characterRace'),
            initialValue: newRace,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Race',
            ),
            onChanged: (newValue) {
              setState(() {
                newRace = newValue;
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          // Character Class
          Text("Character Class", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('characterClass'),
            initialValue: newClass,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Class',
            ),
            onChanged: (newValue) {
              setState(() {
                newClass = newValue;
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          // Character Background
          Text("Character Background", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('characterBackground'),
            initialValue: newBackground,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Background',
            ),
            onChanged: (newValue) {
              setState(() {
                newBackground = newValue;
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          // Character Alignment
          Text("Character Alignment", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('characterAlignment'),
            initialValue: newAlignment,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Alignment',
            ),
            onChanged: (newValue) {
              setState(() {
                newAlignment = newValue;
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          // Character Level
          Text("Character Level (total)", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('characterLevel'),
            initialValue: newLevel.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Level',

            ),
            onChanged: (newValue) {
              setState(() {
                newLevel = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          // Maximum HP
          Text("Maximum Hit Points", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('maxhp'),
            initialValue: newMaximumHitPoints.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Character Level',

            ),
            onChanged: (newValue) {
              setState(() {
                newMaximumHitPoints = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          Text("Armor Class", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('ac'),
            initialValue: newArmorClass.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Armor Class',

            ),
            onChanged: (newValue) {
              setState(() {
                newArmorClass = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),

          TextButton(
              onPressed: () {
                setState(() {
                  stage++;
                });
              },
              child: Text("Next Step")
          )
        ];
        break;

      case 1:
        return [
          Text("Ability Scores", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20.0),
          Text("Strength", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('strengthScore'),
            initialValue: newStrength.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Strength Score',

            ),
            onChanged: (newValue) {
              setState(() {
                newStrength = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),
          Text("Dexterity", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('dexterityScore'),
            initialValue: newDexterity.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Dexterity Score',

            ),
            onChanged: (newValue) {
              setState(() {
                newDexterity = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),
          Text("Constitution", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('constitutionScore'),
            initialValue: newConstitution.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Constitution Score',

            ),
            onChanged: (newValue) {
              setState(() {
                newConstitution = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),
          Text("Intelligence", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('intelligenceScore'),
            initialValue: newIntelligence.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Intelligence Score',

            ),
            onChanged: (newValue) {
              setState(() {
                newIntelligence = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),
          Text("Wisdom", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('wisdomScore'),
            initialValue: newWisdom.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Wisdom Score',

            ),
            onChanged: (newValue) {
              setState(() {
                newWisdom = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),
          Text("Charisma", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),),
          TextFormField(
            key: Key('charismaScore'),
            initialValue: newCharisma.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Charisma Score',

            ),
            onChanged: (newValue) {
              setState(() {
                newCharisma = int.parse(newValue);
              });
            },
            style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  stage++;
                });
              },
              child: Text("Next Step")
          )
        ];
        break;

      case 2:
        return [
          Text("Saving Throw Proficiencies", style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20.0),
          Text("Strength", style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newStrengthSavingThrowProficiency = val;
              });
            },
            hint: Text(newStrengthSavingThrowProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Dexterity", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newDexteritySavingThrowProficiency = val;
              });
            },
            hint: Text(newDexteritySavingThrowProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Constitution", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newConstitutionSavingThrowProficiency = val;
              });
            },
            hint: Text(newConstitutionSavingThrowProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Intelligence", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newIntelligenceSavingThrowProficiency = val;
              });
            },
            hint: Text(newIntelligenceSavingThrowProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Wisdom", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newWisdomSavingThrowProficiency = val;
              });
            },
            hint: Text(newWisdomSavingThrowProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Charisma", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newCharismaSavingThrowProficiency = val;
              });
            },
            hint: Text(newCharismaSavingThrowProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  stage++;
                });
              },
              child: Text("Next Step")
          )
        ];
        break;

      case 3:
        return [
          Text("Skill Proficiencies", style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20.0),
          Text("Acrobatics", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newAcrobaticsProficiency = val;
              });
            },
            hint: Text(newAcrobaticsProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Animal Handling", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newAnimalHandlingProficiency = val;
              });
            },
            hint: Text(newAnimalHandlingProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Arcana", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newArcanaProficiency = val;
              });
            },
            hint: Text(newArcanaProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Athletics", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newAthleticsProficiency = val;
              });
            },
            hint: Text(newAthleticsProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Deception", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newDeceptionProficiency = val;
              });
            },
            hint: Text(newDeceptionProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("History", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newHistoryProficiency = val;
              });
            },
            hint: Text(newHistoryProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Insight", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newInsightProficiency = val;
              });
            },
            hint: Text(newInsightProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Intimidation", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newIntimidationProficiency = val;
              });
            },
            hint: Text(newIntimidationProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Investigation", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newInvestigationProficiency = val;
              });
            },
            hint: Text(newInvestigationProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Medicine", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newMedicineProficiency = val;
              });
            },
            hint: Text(newMedicineProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Nature", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newNatureProficiency = val;
              });
            },
            hint: Text(newNatureProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Perception", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newPerceptionProficiency = val;
              });
            },
            hint: Text(newPerceptionProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Performance", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newPerformanceProficiency = val;
              });
            },
            hint: Text(newPerformanceProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Persuasion", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newPersuasionProficiency = val;
              });
            },
            hint: Text(newPersuasionProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Religion", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newReligionProficiency = val;
              });
            },
            hint: Text(newReligionProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Sleight of Hand", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newSleightOfHandProficiency = val;
              });
            },
            hint: Text(newSleightOfHandProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Stealth", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newStealthProficiency = val;
              });
            },
            hint: Text(newStealthProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
          Text("Survival", style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          )),
          DropdownButton(
            items: proficiencyValues,
            onChanged: (val) {
              setState(() {
                newSurvivalProficiency = val;
              });
            },
            hint: Text(newSurvivalProficiency, style: TextStyle(
              color: Color.fromARGB(255, 221, 246, 254),
            ),),
          ),
        ];
        break;
    }
  }

  void updateStateToCharacter (Character5e character) {
    setState(() {
      newName = character.characterName;
      newRace = character.characterRace;
      newClass = character.characterClass;
      newBackground = character.characterBackground;
      newAlignment = character.characterAlignment;
      newLevel = character.characterLevel;

      // Ability Scores
      newStrength = character.strengthScore;
      newDexterity = character.dexterityScore;
      newConstitution = character.constitutionScore;
      newIntelligence = character.intelligenceScore;
      newWisdom = character.wisdomScore;
      newCharisma = character.charismaScore;

      newStrengthSavingThrowProficiency = proficiencyLabels[character.strengthSavingThrowProficiency];
      newDexteritySavingThrowProficiency = proficiencyLabels[character.dexteritySavingThrowProficiency];
      newConstitutionSavingThrowProficiency = proficiencyLabels[character.constitutionSavingThrowProficiency];
      newIntelligenceSavingThrowProficiency = proficiencyLabels[character.intelligenceSavingThrowProficiency];
      newWisdomSavingThrowProficiency = proficiencyLabels[character.wisdomSavingThrowProficiency];
      newCharismaSavingThrowProficiency = proficiencyLabels[character.charismaSavingThrowProficiency];

      newAcrobaticsProficiency = proficiencyLabels[character.acrobaticsProficiency];
      newAnimalHandlingProficiency = proficiencyLabels[character.animalHandlingProficiency];
      newArcanaProficiency = proficiencyLabels[character.arcanaProficiency];
      newAthleticsProficiency = proficiencyLabels[character.athleticsProficiency];
      newDeceptionProficiency = proficiencyLabels[character.deceptionProficiency];
      newHistoryProficiency = proficiencyLabels[character.historyProficiency];
      newInsightProficiency = proficiencyLabels[character.insightProficiency];
      newIntimidationProficiency = proficiencyLabels[character.intimidationProficiency];
      newInvestigationProficiency = proficiencyLabels[character.investigationProficiency];
      newMedicineProficiency = proficiencyLabels[character.medicineProficiency];
      newNatureProficiency = proficiencyLabels[character.natureProficiency];
      newPerceptionProficiency = proficiencyLabels[character.perceptionProficiency];
      newPerformanceProficiency = proficiencyLabels[character.performanceProficiency];
      newPersuasionProficiency = proficiencyLabels[character.persuasionProficiency];
      newReligionProficiency = proficiencyLabels[character.religionProficiency];
      newSleightOfHandProficiency = proficiencyLabels[character.sleightOfHandProficiency];
      newStealthProficiency = proficiencyLabels[character.stealthProficiency];
      newSurvivalProficiency = proficiencyLabels[character.survivalProficiency];

      newMaximumHitPoints = character.maximumHitPoints;
      newArmorClass = character.armorClass;
    });
  }

  @override
  Widget build(BuildContext context) {
    ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;
    Character5e character = args.character;

    int getProficiencyValue(String proficiencyLabel) {
      switch (proficiencyLabel) {
        case "Not Proficient":
          return 0;
          break;

        case "Jack of All Trades":
          return 1;
          break;

        case "Proficient":
          return 2;
          break;

        case "Expertise":
          return 3;
          break;

        default:
          return -1;
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Editing ${character.characterName}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Visibility(
                  child: Column(
                      children: [
                        Column(
                          children: getPageContents(),
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                        Visibility(
                            visible: stage == 3,
                            child: MaterialButton(
                              child: Text("Save Character"),
                              onPressed: () {
                                character.characterName = newName;
                                character.characterRace = newRace;
                                character.characterClass = newClass;
                                character.characterBackground = newBackground;
                                character.characterAlignment = newAlignment;
                                character.characterLevel = newLevel;

                                character.strengthScore = newStrength;
                                character.dexterityScore = newDexterity;
                                character.constitutionScore = newConstitution;
                                character.intelligenceScore = newIntelligence;
                                character.wisdomScore = newWisdom;
                                character.charismaScore = newCharisma;

                                character.strengthSavingThrowProficiency = getProficiencyValue(newStrengthSavingThrowProficiency);
                                character.dexteritySavingThrowProficiency = getProficiencyValue(newDexteritySavingThrowProficiency);
                                character.constitutionSavingThrowProficiency = getProficiencyValue(newConstitutionSavingThrowProficiency);
                                character.intelligenceSavingThrowProficiency = getProficiencyValue(newIntelligenceSavingThrowProficiency);
                                character.wisdomSavingThrowProficiency = getProficiencyValue(newWisdomSavingThrowProficiency);
                                character.charismaSavingThrowProficiency = getProficiencyValue(newCharismaSavingThrowProficiency);

                                character.acrobaticsProficiency = getProficiencyValue(newAcrobaticsProficiency);
                                character.animalHandlingProficiency = getProficiencyValue(newAnimalHandlingProficiency);
                                character.arcanaProficiency = getProficiencyValue(newArcanaProficiency);
                                character.athleticsProficiency = getProficiencyValue(newAthleticsProficiency);
                                character.deceptionProficiency = getProficiencyValue(newDeceptionProficiency);
                                character.historyProficiency = getProficiencyValue(newHistoryProficiency);
                                character.insightProficiency = getProficiencyValue(newInsightProficiency);
                                character.intimidationProficiency = getProficiencyValue(newIntimidationProficiency);
                                character.investigationProficiency = getProficiencyValue(newInvestigationProficiency);
                                character.medicineProficiency = getProficiencyValue(newMedicineProficiency);
                                character.natureProficiency = getProficiencyValue(newNatureProficiency);
                                character.perceptionProficiency = getProficiencyValue(newPerceptionProficiency);
                                character.performanceProficiency = getProficiencyValue(newPerformanceProficiency);
                                character.persuasionProficiency = getProficiencyValue(newPersuasionProficiency);
                                character.religionProficiency = getProficiencyValue(newReligionProficiency);
                                character.sleightOfHandProficiency = getProficiencyValue(newSleightOfHandProficiency);
                                character.stealthProficiency = getProficiencyValue(newStealthProficiency);
                                character.survivalProficiency = getProficiencyValue(newSurvivalProficiency);

                                character.maximumHitPoints = newMaximumHitPoints;
                                character.armorClass = newArmorClass;

                                Navigator.pop(context, character);
                              },
                              height: 28.0,
                              minWidth: 84.0,
                              color: Color.fromARGB(255, 221, 246, 254),
                            )
                        )
                      ],
                    ),
                  visible: characterEditVisible,
                ),
                Visibility(
                  child: Column(
                    children: [
                      MaterialButton(
                        child: Text("Edit Character Directly"),
                        height: 28.0,
                        minWidth: 84.0,
                        color: Color.fromARGB(255, 221, 246, 254),
                        onPressed: () {
                          setState(() {
                            updateStateToCharacter(character);
                            characterEditVisible = true;
                          });
                        },
                      ),
                      MaterialButton(
                        child: Text("Import from D&D Beyond (Coming Soon)"),
                        height: 28.0,
                        minWidth: 84.0,
                        color: Color.fromARGB(255, 128, 128, 128),
                        onPressed: () {
                          Fluttertoast.showToast(msg: "D&D Beyond Integration coming soon!");
                        },
                      ),
                    ],
                  ),
                  visible: !characterEditVisible,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

