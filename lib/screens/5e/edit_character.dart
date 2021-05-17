import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:flutter/material.dart';

class EditCharacter5e extends StatefulWidget {
  const EditCharacter5e({Key key}) : super(key: key);

  @override
  _EditCharacter5eState createState() => _EditCharacter5eState();
}

class _EditCharacter5eState extends State<EditCharacter5e> {
  int updater = 0;
  int diceType = 0;

  int newStrengthSavingThrowProficiency = 0;
  int newDexteritySavingThrowProficiency = 0;
  int newConstitutionSavingThrowProficiency = 0;
  int newIntelligenceSavingThrowProficiency = 0;
  int newWisdomSavingThrowProficiency = 0;
  int newCharismaSavingThrowProficiency = 0;

  @override
  Widget build(BuildContext context) {
    ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;
    Character5e character = args.character;

    // Character Details
    String newName = character.characterName;
    String newRace = character.characterRace;
    String newClass = character.characterClass;
    String newBackground = character.characterBackground;
    String newAlignment = character.characterAlignment;
    int newLevel = character.characterLevel;

    // Ability Scores
    int newStrength = character.strengthScore;
    int newDexterity = character.dexterityScore;
    int newConstitution = character.constitutionScore;
    int newIntelligence = character.intelligenceScore;
    int newWisdom = character.wisdomScore;
    int newCharisma = character.charismaScore;


    String getProficiencyLabel (int proficiencyValue) {
      switch(proficiencyValue) {
        case 1:
          return "Jack of All Trades";

        case 2:
          return "Proficient";

        case 3:
          return "Expertise";

        default:
          return "Not Proficient";
      }
    }

    List<DropdownMenuItem> proficiencyValues = [
      DropdownMenuItem(
        child: Text("Not Proficient"),
        value: 0,
      ),
      DropdownMenuItem(
        child: Text("Jack of All Trades"),
        value: 1,
      ),
      DropdownMenuItem(
        child: Text("Proficient"),
        value: 2,
      ),
      DropdownMenuItem(
        child: Text("Expertise"),
        value: 3,
      ),
    ];

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
                // Character Name
                Text("Character Name"),
                TextFormField(
                  initialValue: newName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Character Name',
                  ),
                  onChanged: (newValue) {
                    newName = newValue;
                  }
                ),

                // Character Race
                Text("Character Race"),
                TextFormField(
                    initialValue: newRace,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Character Race',
                    ),
                    onChanged: (newValue) {
                      newRace = newValue;
                    }
                ),

                // Character Class
                Text("Character Class"),
                TextFormField(
                    initialValue: newClass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Character Class',
                    ),
                    onChanged: (newValue) {
                      newClass = newValue;
                    }
                ),

                // Character Class
                Text("Character Background"),
                TextFormField(
                    initialValue: newBackground,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Character Background',
                    ),
                    onChanged: (newValue) {
                      newBackground = newValue;
                    }
                ),

                // Character Class
                Text("Character Alignment"),
                TextFormField(
                    initialValue: newAlignment,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Character Alignment',
                    ),
                    onChanged: (newValue) {
                      newAlignment = newValue;
                    }
                ),

                // Character Level
                Text("Character Level (total)"),
                TextFormField(
                    initialValue: newLevel.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Character Level',

                    ),
                    onChanged: (newValue) {
                      newLevel = int.parse(newValue);
                    }
                ),

                // Spacer
                SizedBox(height: 20.0),
                Divider(
                  thickness: 5.0,
                ),
                SizedBox(height: 20.0),

                // Ability Scores
                Text("Ability Scores"),
                SizedBox(height: 20.0),
                Text("Strength"),
                TextFormField(
                    initialValue: newStrength.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Strength Score',

                    ),
                    onChanged: (newValue) {
                      newStrength = int.parse(newValue);
                    }
                ),
                Text("Dexterity"),
                TextFormField(
                    initialValue: newDexterity.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Dexterity Score',

                    ),
                    onChanged: (newValue) {
                      newDexterity = int.parse(newValue);
                    }
                ),
                Text("Constitution"),
                TextFormField(
                    initialValue: newConstitution.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Constitution Score',

                    ),
                    onChanged: (newValue) {
                      newConstitution = int.parse(newValue);
                    }
                ),
                Text("Intelligence"),
                TextFormField(
                    initialValue: newIntelligence.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Intelligence Score',

                    ),
                    onChanged: (newValue) {
                      newIntelligence = int.parse(newValue);
                    }
                ),
                Text("Wisdom"),
                TextFormField(
                    initialValue: newWisdom.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Wisdom Score',

                    ),
                    onChanged: (newValue) {
                      newWisdom = int.parse(newValue);
                    }
                ),
                Text("Charisma"),
                TextFormField(
                    initialValue: newCharisma.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Charisma Score',

                    ),
                    onChanged: (newValue) {
                      newCharisma = int.parse(newValue);
                    }
                ),

                // Spacer
                SizedBox(height: 20.0),
                Divider(
                  thickness: 5.0,
                ),
                SizedBox(height: 20.0),

                // Saving Throw Proficiencies
                Text("Saving Throw Proficiencies"),
                SizedBox(height: 20.0),
                Text("Strength"),
                DropdownButton(
                  items: proficiencyValues,
                  onChanged: (val) {
                    setState(() {
                      newStrengthSavingThrowProficiency = val;
                    });
                  },
                  hint: Text(getProficiencyLabel(newStrengthSavingThrowProficiency)),
                ),
                Text("Dexterity"),
                DropdownButton(
                  items: proficiencyValues,
                  onChanged: (val) {
                    setState(() {
                      newDexteritySavingThrowProficiency = val;
                    });
                  },
                  hint: Text(getProficiencyLabel(newDexteritySavingThrowProficiency)),
                ),
                Text("Constitution"),
                DropdownButton(
                  items: proficiencyValues,
                  onChanged: (val) {
                    setState(() {
                      newConstitutionSavingThrowProficiency = val;
                    });
                  },
                  hint: Text(getProficiencyLabel(newConstitutionSavingThrowProficiency)),
                ),
                Text("Intelligence"),
                DropdownButton(
                  items: proficiencyValues,
                  onChanged: (val) {
                    setState(() {
                      newIntelligenceSavingThrowProficiency = val;
                    });
                  },
                  hint: Text(getProficiencyLabel(newIntelligenceSavingThrowProficiency)),
                ),
                Text("Wisdom"),
                DropdownButton(
                  items: proficiencyValues,
                  onChanged: (val) {
                    setState(() {
                      newWisdomSavingThrowProficiency = val;
                    });
                  },
                  hint: Text(getProficiencyLabel(newWisdomSavingThrowProficiency)),
                ),
                Text("Charisma"),
                DropdownButton(
                  items: proficiencyValues,
                  onChanged: (val) {
                    setState(() {
                      newCharismaSavingThrowProficiency = val;
                    });
                  },
                  hint: Text(getProficiencyLabel(newCharismaSavingThrowProficiency)),
                ),

                // Save Button
                MaterialButton(
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

                    character.strengthSavingThrowProficiency = newStrengthSavingThrowProficiency;
                    character.dexteritySavingThrowProficiency = newDexteritySavingThrowProficiency;
                    character.constitutionSavingThrowProficiency = newConstitutionSavingThrowProficiency;
                    character.intelligenceSavingThrowProficiency = newIntelligenceSavingThrowProficiency;
                    character.wisdomSavingThrowProficiency = newWisdomSavingThrowProficiency;
                    character.charismaSavingThrowProficiency = newCharismaSavingThrowProficiency;

                    Navigator.pop(context, character);
                  },
                  height: 28.0,
                  minWidth: 84.0,
                  color: Color.fromARGB(255, 221, 246, 254),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
