import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/methods_5e.dart';
import 'package:flutter/material.dart';

class AddFeature5e extends StatefulWidget {
  const AddFeature5e({Key key}) : super(key: key);

  @override
  _AddFeature5eState createState() => _AddFeature5eState();
}

class _AddFeature5eState extends State<AddFeature5e> {
  String featureName;
  String featureSource = '';
  String featureDescription;
  bool hasResourceCount = false;
  int resourceCount = 0;

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Feature"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Feature Name",
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
                  hintText: 'Feature Name',
                ),
                onChanged: (newValue) {
                  setState(() {
                    featureName = newValue;
                  });
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Feature Source",
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
                    child: Text("Racial Feature"),
                    value: "Racial Feature",
                  ),
                  DropdownMenuItem(
                    child: Text("Background Feature"),
                    value: "Background Feature",
                  ),
                  DropdownMenuItem(
                    child: Text("Class Feature"),
                    value: "Class Feature",
                  ),
                  DropdownMenuItem(
                    child: Text("Feat"),
                    value: "Feat",
                  )
                ],
                onChanged: (val) {
                  setState(() {
                    featureSource = val;
                  });
                },
                hint: Text(
                    featureSource,
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Feature Description",
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
                    hintText: 'Feature Description',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      featureDescription = newValue;
                    });
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Does this feature have a use count?",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                ),
              ),
            ),
            Checkbox(
              value: hasResourceCount,
              onChanged: (newValue) {
                setState(() {
                  hasResourceCount = newValue;
                });
              }
            ),
            Visibility(
              visible: hasResourceCount,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "How many times can you use the feature?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 221, 246, 254),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Use Count',
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            resourceCount = int.parse(newValue);
                          });
                        }
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                child: Text("Add Feature"),
                onPressed: () {
                  if (!hasResourceCount) {
                    resourceCount = 0;
                  }

                  Feature5e newFeature = new Feature5e(
                    name: featureName,
                    source: featureSource,
                    description: featureDescription,
                    hasResources: hasResourceCount,
                    resourceCount: resourceCount
                  );

                  Character5e character = args.character;
                  character.addFeature(newFeature);

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
