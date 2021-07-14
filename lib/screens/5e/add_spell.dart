import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/spell_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/methods_5e.dart';
import 'package:flutter/material.dart';

class AddSpell5e extends StatefulWidget {
  const AddSpell5e({Key key}) : super(key: key);

  @override
  _AddSpell5eState createState() => _AddSpell5eState();
}

class _AddSpell5eState extends State<AddSpell5e> {
  String spellName;
  int spellLevel = 0;
  String spellDescription;

  List<String> spellLabels = [
    'Cantrip',
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eighth',
    'Ninth'
  ];

  List<DropdownMenuItem> getSpellDropdownValues () {
    List<DropdownMenuItem> spellDropdownValues = [];

    for (var i = 0; i < spellLabels.length; i++) {
      spellDropdownValues.add(DropdownMenuItem(
        child: Text(
          spellLabels[i],
          style: TextStyle(
            color: Color.fromARGB(255, 221, 246, 254),
          ),
        ),
        value: i,
      ));
    }

    return spellDropdownValues;
  }

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Spell"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Spell Name",
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
                  hintText: 'Spell Name',
                ),
                onChanged: (newValue) {
                  setState(() {
                    spellName = newValue;
                  });
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Spell Level",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton(
                items: getSpellDropdownValues(),
                onChanged: (val) {
                  setState(() {
                    spellLevel = val;
                  });
                },
                hint: Text(
                    spellLabels.elementAt(spellLevel),
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Spell Description",
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
                    hintText: 'Spell Description',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      spellDescription = newValue;
                    });
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                child: Text("Add Spell"),
                onPressed: () {
                  Spell5e newSpell = new Spell5e(
                    name: spellName,
                    spellDescription: spellDescription,
                    spellLevel: spellLevel
                  );

                  Character5e character = args.character;
                  character.addSpell(newSpell);

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
    );
  }
}
