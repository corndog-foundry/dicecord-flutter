import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dicecord_mobile/opening_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Standard rolls
  String rollLabel = '';
  int nD4 = 0;
  int nD6 = 0;
  int nD8 = 0;
  int nD10 = 0;
  int nD12 = 0;
  int nD20 = 0;
  int bonus = 0;

  // Star Wars rolls
  String swRollLabel = '';
  String swForceRollLabel = '';
  int nBlue = 0;
  int nBlack = 0;
  int nGreen = 0;
  int nPurple = 0;
  int nYellow = 0;
  int nRed = 0;
  int nForce = 0;

  // Vampire rolls
  String vampireRollLabel = '';
  int nNormal = 0;
  int nHunger = 0;

  void calculateRollFormula() {
    String newLabel = '';

    if (nD4 > 0) {
      newLabel += "${nD4}d4";
    }

    if (nD6 > 0) {
      if (newLabel == '') {
        newLabel += "${nD6}d6";
      } else {
        newLabel += " + ${nD6}d6";
      }
    }

    if (nD8 > 0) {
      if (newLabel == '') {
        newLabel += "${nD8}d8";
      } else {
        newLabel += " + ${nD8}d8";
      }
    }

    if (nD10 > 0) {
      if (newLabel == '') {
        newLabel += "${nD10}d10";
      } else {
        newLabel += " + ${nD10}d10";
      }
    }

    if (nD12 > 0) {
      if (newLabel == '') {
        newLabel += "${nD12}d12";
      } else {
        newLabel += " + ${nD12}d12";
      }
    }

    if (nD20 > 0) {
      if (newLabel == '') {
        newLabel += "${nD20}d20";
      } else {
        newLabel += " + ${nD20}d20";
      }
    }

    if (bonus != 0) {
      if (newLabel == '') {
        newLabel += "$bonus";
      } else {
        if (bonus > 0) {
          newLabel += " + $bonus";
        } else {
          newLabel += " - ${bonus.abs()}";
        }
      }
    }

    rollLabel = newLabel;
  }

  void calculateSWRollFormula() {
    String newLabel = '';

    if (nBlue > 0) {
      newLabel += "${nBlue} boost";
    }

    if (nBlack > 0) {
      if (newLabel == '') {
        newLabel += "${nBlack} setback";
      } else {
        newLabel += " + ${nBlack} setback";
      }
    }

    if (nGreen > 0) {
      if (newLabel == '') {
        newLabel += "${nGreen} ability";
      } else {
        newLabel += " + ${nGreen} ability";
      }
    }

    if (nPurple > 0) {
      if (newLabel == '') {
        newLabel += "${nPurple} difficulty";
      } else {
        newLabel += " + ${nPurple} difficulty";
      }
    }

    if (nYellow > 0) {
      if (newLabel == '') {
        newLabel += "${nYellow} proficiency";
      } else {
        newLabel += " + ${nYellow} proficiency";
      }
    }

    if (nRed > 0) {
      if (newLabel == '') {
        newLabel += "$nRed challenge";
      } else {
        newLabel += " + $nRed challenge";
      }
    }

    swRollLabel = newLabel;
  }

  void calculateSWForceRollFormula() {
    String newLabel = '';

    if (nForce > 0) {
        newLabel += "$nForce force";
    }

    swForceRollLabel = newLabel;
  }

  void calculateVampireRollFormula() {
    String newLabel = '';

    if (nNormal > 0) {
      newLabel += "$nNormal normal";
    }

    if (nHunger > 0) {
      if (nNormal > 0) {
        newLabel += " + $nHunger hunger";
      } else {
        newLabel += "$nHunger hunger";
      }
    }

    vampireRollLabel = newLabel;
  }

  List roll() {
    Random rng = new Random();
    int total = 0;
    List<int> rolls = [];
    int newRoll = 0;

    for (var i = 0; i < nD4; i++) {
      newRoll = (1 + rng.nextInt(4));
      rolls.add(newRoll);
      total += newRoll;
    }

    for (var i = 0; i < nD6; i++) {
      newRoll = (1 + rng.nextInt(6));
      rolls.add(newRoll);
      total += newRoll;
    }

    for (var i = 0; i < nD8; i++) {
      newRoll = (1 + rng.nextInt(8));
      rolls.add(newRoll);
      total += newRoll;
    }

    for (var i = 0; i < nD10; i++) {
      newRoll = (1 + rng.nextInt(10));
      rolls.add(newRoll);
      total += newRoll;
    }

    for (var i = 0; i < nD12; i++) {
      newRoll = (1 + rng.nextInt(12));
      rolls.add(newRoll);
      total += newRoll;
    }

    for (var i = 0; i < nD20; i++) {
      newRoll = (1 + rng.nextInt(20));
      rolls.add(newRoll);
      total += newRoll;
    }

    total += bonus;

    return [total, rolls];
  }

  List rollSW(bool verbose) {
    Random rng = new Random();
    int total = 0;
    List<String> blueRolls = [];
    List<String> blackRolls = [];
    List<String> greenRolls = [];
    List<String> purpleRolls = [];
    List<String> yellowRolls = [];
    List<String> redRolls = [];

    int newRoll = 0;
    String rollResult = '';

    int success = 0;
    int advantage = 0;

    bool triumph = false;
    bool despair = false;

    for (var i = 0; i < nBlue; i++) {
      switch(1 + rng.nextInt(6)) {
        case 1:
          rollResult = 'B';
          break;

        case 2:
          rollResult = 'B';
          break;

        case 3:
          rollResult = 'S';
          success++;
          break;

        case 4:
          rollResult = 'SA';
          success++;
          advantage++;
          break;

        case 5:
          rollResult = 'AA';
          advantage += 2;
          break;

        case 6:
          rollResult = 'A';
          advantage++;
          break;
      }

      blueRolls.add(rollResult);
    }

    for (var i = 0; i < nBlack; i++) {
      switch(1 + rng.nextInt(6)) {
        case 1:
          rollResult = 'B';
          break;
        case 2:
          rollResult = 'B';
          break;
        case 3:
          rollResult = 'F';
          success--;
          break;
        case 4:
          rollResult = 'F';
          success--;
          break;
        case 5:
          rollResult = 'T';
          advantage--;
          break;
        case 6:
          rollResult = 'T';
          advantage--;
          break;
      }

      blackRolls.add(rollResult);
    }

    for (var i = 0; i < nGreen; i++) {
      switch(1 + rng.nextInt(8)) {
        case 1:
          rollResult = 'B';
          break;
        case 2:
          rollResult = 'S';
          success++;
          break;
        case 3:
          rollResult = 'S';
          success++;
          break;
        case 4:
          rollResult = 'SS';
          success += 2;
          break;
        case 5:
          rollResult = 'A';
          advantage++;
          break;
        case 6:
          rollResult = 'A';
          advantage++;
          break;
        case 7:
          rollResult = 'SA';
          advantage++;
          success++;
          break;
        case 8:
          rollResult = 'AA';
          advantage += 2;
          break;
      }

      greenRolls.add(rollResult);
    }

    for (var i = 0; i < nPurple; i++) {
      switch(1 + rng.nextInt(8)) {
        case 1:
          rollResult = 'B';
          break;
        case 2:
          rollResult = 'F';
          success--;
          break;
        case 3:
          rollResult = 'FF';
          success -= 2;
          break;
        case 4:
          rollResult = 'T';
          advantage--;
          break;
        case 5:
          rollResult = 'T';
          advantage--;
          break;
        case 6:
          rollResult = 'T';
          advantage--;
          break;
        case 7:
          rollResult = 'TT';
          advantage -= 2;
          break;
        case 8:
          rollResult = 'FT';
          success--;
          advantage--;
      }

      purpleRolls.add(rollResult);
    }

    for (var i = 0; i < nYellow; i++) {
      switch(1 + rng.nextInt(12)) {
        case 1:
          rollResult = 'B';
          break;
        case 2:
          rollResult = 'S';
          success++;
          break;
        case 3:
          rollResult = 'S';
          success++;
          break;
        case 4:
          rollResult = 'SS';
          success += 2;
          break;
        case 5:
          rollResult = 'SS';
          success += 2;
          break;
        case 6:
          rollResult = 'A';
          advantage++;
          break;
        case 7:
          rollResult = 'SA';
          success++;
          advantage++;
          break;
        case 8:
          rollResult = 'SA';
          success++;
          advantage++;
          break;
        case 9:
          rollResult = 'SA';
          success++;
          advantage++;
          break;
        case 10:
          rollResult='AA';
          advantage += 2;
          break;
        case 11:
          rollResult='AA';
          advantage += 2;
          break;
        case 12:
          rollResult = 'Tr';
          triumph = true;
          break;
      }

      yellowRolls.add(rollResult);
    }

    for (var i = 0; i < nRed; i++) {
      switch(1 + rng.nextInt(12)) {
        case 1:
          rollResult = 'B';
          break;
        case 2:
          rollResult = 'F';
          success--;
          break;
        case 3:
          rollResult = 'F';
          success--;
          break;
        case 4:
          rollResult = 'FF';
          success -= 2;
          break;
        case 5:
          rollResult = 'FF';
          success -= 2;
          break;
        case 6:
          rollResult = 'T';
          advantage--;
          break;
        case 7:
          rollResult = 'T';
          advantage--;
          break;
        case 8:
          rollResult = 'FT';
          success--;
          advantage--;
          break;
        case 9:
          rollResult = 'FT';
          success--;
          advantage--;
          break;
        case 10:
          rollResult = 'TT';
          advantage -= 2;
          break;
        case 11:
          rollResult = 'TT';
          advantage -= 2;
          break;
        case 11:
          rollResult = 'D';
          despair = true;
          break;
      }

      redRolls.add(rollResult);
    }

    total += bonus;

    List fields = [];

    if (triumph) {
      fields.add({
        "name": "Triumph?",
        "value": "Yes"
      });
    }

    if (despair) {
      fields.add({
        "name": "Despair?",
        "value": "Yes"
      });
    }

    if (verbose) {
      if (blueRolls.length > 0) {
        fields.add({
          "name": "Boost Rolls",
          "value": blueRolls.toString()
        });
      }

      if (blackRolls.length > 0) {
        fields.add({
          "name": "Setback Rolls",
          "value": blackRolls.toString()
        });
      }

      if (greenRolls.length > 0) {
        fields.add({
          "name": "Ability Rolls",
          "value": greenRolls.toString()
        });
      }

      if (purpleRolls.length > 0) {
        fields.add({
          "name": "Difficulty Rolls",
          "value": purpleRolls.toString()
        });
      }

      if (yellowRolls.length > 0) {
        fields.add({
          "name": "Proficiency Rolls",
          "value": yellowRolls.toString()
        });
      }

      if (redRolls.length > 0) {
        fields.add({
          "name": "Challenge Rolls",
          "value": redRolls.toString()
        });
      }
    }
    return [success, advantage, fields];
  }

  List rollForce(bool verbose) {
    Random rng = new Random();
    List<String> rolls = [];
    String rollResult = '';

    int light = 0;
    int dark = 0;

    for (var i = 0; i < nForce; i++) {
      switch(1 + rng.nextInt(12)) {
        case 1:
          rollResult = 'D';
          dark++;
          break;
        case 2:
          rollResult = 'D';
          dark++;
          break;
        case 3:
          rollResult = 'D';
          dark++;
          break;
        case 4:
          rollResult = 'D';
          dark++;
          break;
        case 5:
          rollResult = 'D';
          dark++;
          break;
        case 6:
          rollResult = 'D';
          dark++;
          break;
        case 7:
          rollResult = 'DD';
          dark += 2;
          break;
        case 8:
          rollResult = 'L';
          light++;
          break;
        case 9:
          rollResult = 'L';
          light++;
          break;
        case 10:
          rollResult = 'LL';
          light += 2;
          break;
        case 11:
          rollResult = 'LL';
          light += 2;
          break;
        case 12:
          rollResult = 'LL';
          light += 2;
          break;
      }

      rolls.add(rollResult);
    }

    if (verbose) {
      List fields = [];
      fields.add({
          "name": "Rolls",
          "value": rolls.toString()
      });

      return [light, dark, fields];
    } else {
      return [light, dark, []];
    }
  }

  List rollVampire (bool verbose) {
    Random rng = new Random();
    List<String> normalRolls = [];
    List<String> hungerRolls = [];
    String rollResult = '';
    int roll;

    int successes = 0;
    int criticals = 0;
    bool bestialFailure = false;
    bool messyCritical = false;

    for (var i = 0; i < nNormal; i++) {
      roll = 1 + rng.nextInt(10);

      if (roll > 5 && roll < 10) {
        successes++;
        rollResult = 'S';
      } else if (roll == 10) {
        criticals++;
        if (criticals % 2 == 0) {
          criticals -= 2;
          successes += 4;
        }
        rollResult = 'C';
      } else {
        rollResult = 'F';
      }

      normalRolls.add(rollResult);
    }

    for (var i = 0; i < nHunger; i++) {
      roll = 1 + rng.nextInt(10);

      if (roll == 1) {
        bestialFailure = true;
        rollResult = 'B';
      }
      else if (roll > 5 && roll < 10) {
        successes++;
        rollResult = 'S';
      }
      else if (roll == 10) {
        criticals++;
        if (criticals % 2 == 0) {
          criticals -= 2;
          successes += 4;
          messyCritical = true;
        }
        rollResult = 'M';
      } else {
        rollResult = 'F';
      }

      hungerRolls.add(rollResult);
    }

    List fields = [];

    if (bestialFailure) {
      fields.add({
        "name": "Bestial Failure?",
        "value": "Yes"
      });
    }

    if (messyCritical) {
      fields.add({
        "name": "Messy Critical?",
        "value": "Yes"
      });
    }

    if (verbose) {
      if (nNormal > 0) {
        fields.add({
          "name": "Normal Rolls",
          "value": normalRolls.toString()
        });
      }

      if (nHunger > 0) {
        fields.add({
          "name": "Hunger Rolls",
          "value": hungerRolls.toString()
        });
      }
    }

    successes += criticals;

    return [successes, fields];

  }

  Map buildPayload(String payloadHeader, List fields) {
    return {
      "embeds": [
        {
          "title": payloadHeader,
          "fields": fields
        }
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    final OpeningScreenArgs args = ModalRoute.of(context).settings.arguments as OpeningScreenArgs;
    String d4Label = args.diceLabels ? 'd4' : '';
    String d6Label = args.diceLabels ? 'd6' : '';
    String d8Label = args.diceLabels ? 'd8' : '';
    String d10Label = args.diceLabels ? 'd10' : '';
    String d12Label = args.diceLabels ? 'd12' : '';
    String d20Label = args.diceLabels ? 'd20' : '';

    String boostLabel = args.diceLabels ? 'Boost' : '';
    String setbackLabel = args.diceLabels ? 'Setback' : '';
    String abilityLabel = args.diceLabels ? 'Ability' : '';
    String difficultyLabel = args.diceLabels ? 'Difficulty' : '';
    String proficiencyLabel = args.diceLabels ? 'Proficiency' : '';
    String challengeLabel = args.diceLabels ? 'Challenge' : '';
    String forceLabel = args.diceLabels ? 'Force' : '';

    String normalLabel = args.diceLabels ? 'Normal' : '';
    String hungerLabel = args.diceLabels ? 'Hunger' : '';

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Standard Dice
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Standard Dice",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                child: Container(
                  child: Center(
                    child: Text(
                      rollLabel,
                      style: TextStyle(
                          color: Color.fromARGB(255, 188, 246, 254)
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 20, 28, 47),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 50,
                ),
                onPressed: () => setState(() {
                  List rollOutcome = roll();
                  int total = rollOutcome[0];
                  List rollResults = rollOutcome[1];
                  String header = "${args.nickname} rolled: $rollLabel = $total";
                  List fields = [];

                  if (args.verboseMode) {
                    fields.add({
                      "name": "Rolls",
                      "value": rollResults.toString()
                    });
                  }

                  var payload = json.encode(buildPayload(header, fields));
                  var url = Uri.parse(args.webhookURL);
                  http.post(url, body: payload, headers: {
                    "Content-Type": "application/json"
                  });


                  nD4 = 0;
                  nD6 = 0;
                  nD8 = 0;
                  nD10 = 0;
                  nD12 = 0;
                  nD20 = 0;
                  bonus = 0;

                  calculateRollFormula();
                }),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () => setState(() {
                            nD4++;
                            calculateRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/standard-d4.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  d4Label,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nD6++;
                            calculateRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/standard-d6.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  d6Label,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nD8++;
                            calculateRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/standard-d8.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  d8Label,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () => setState(() {
                            nD10++;
                            calculateRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/standard-d10.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  d10Label,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nD12++;
                            calculateRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/standard-d12.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  d12Label,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nD20++;
                            calculateRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/standard-d20.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  d20Label,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                children: [
                  Container(
                      child: IconButton(
                        icon: Icon(Icons.plus_one),
                        onPressed: () => setState(() {
                          bonus++;
                          calculateRollFormula();
                        }),
                      ),
                      color: Color.fromARGB(255, 221, 246, 254)
                  ),
                  Text(
                    "Bonus",
                    style: TextStyle(
                        color: Color.fromARGB(255, 221, 246, 254)
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.exposure_minus_1),
                      onPressed: () => setState(() {
                        bonus--;
                        calculateRollFormula();
                      }),
                    ),
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),

              // Divider
              SizedBox(
                height: 80.0,
              ),

              // Star Wars Dice
              Text(
                "Star Wars / Genesys",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                child: Container(
                  child: Center(
                    child: Text(
                      swRollLabel,
                      style: TextStyle(
                          color: Color.fromARGB(255, 188, 246, 254)
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 20, 28, 47),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 50,
                ),
                onPressed: () => setState(() {
                  List rollOutcome = rollSW(args.verboseMode);
                  print(rollOutcome);
                  int success = rollOutcome[0];
                  int advantage = rollOutcome[1];

                  swRollLabel = swRollLabel.replaceAll('boost', ':blue_circle:');
                  swRollLabel = swRollLabel.replaceAll('setback', ':black_circle:');
                  swRollLabel = swRollLabel.replaceAll('ability', ':green_circle:');
                  swRollLabel = swRollLabel.replaceAll('difficulty', ':purple_circle:');
                  swRollLabel = swRollLabel.replaceAll('proficiency', ':yellow_circle:');
                  swRollLabel = swRollLabel.replaceAll('challenge', ':red_circle:');

                  String header = "${args.nickname} rolled: $swRollLabel = ";

                  if (success > 0) {
                    header += "Success($success)";
                  } else {
                    header += "Failure(${success.abs()})";
                  }

                  if (advantage > 0) {
                    header += " + Advantage($advantage)";
                  } else if (advantage < 0) {
                    header += " + Threat(${advantage.abs()})";
                  }

                  var payload = json.encode(buildPayload(header, rollOutcome[2]));

                  var url = Uri.parse(args.webhookURL);
                  http.post(url, body: payload, headers: {
                    "Content-Type": "application/json"
                  });


                  nBlue = 0;
                  nBlack = 0;
                  nGreen = 0;
                  nPurple = 0;
                  nYellow = 0;
                  nRed = 0;

                  calculateSWRollFormula();
                }),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () => setState(() {
                            nBlue++;
                            calculateSWRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/starwars-blue.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  boostLabel,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nGreen++;
                            calculateSWRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/starwars-green.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  abilityLabel,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nYellow++;
                            calculateSWRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/starwars-yellow.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  proficiencyLabel,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () => setState(() {
                            nBlack++;
                            calculateSWRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/starwars-black.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  setbackLabel,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nPurple++;
                            calculateSWRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/starwars-purple.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  difficultyLabel,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      FlatButton(
                          onPressed: () => setState(() {
                            nRed++;
                            calculateSWRollFormula();
                          }),
                          child: Column(
                            children: [
                              Image.asset('img/starwars-red.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  challengeLabel,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 221, 246, 254),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),

              // Divider
              SizedBox(
                height: 80.0,
              ),

              // Star Wars Force Dice
              Text(
                "Star Wars Force",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                child: Container(
                  child: Center(
                    child: Text(
                      swForceRollLabel,
                      style: TextStyle(
                          color: Color.fromARGB(255, 188, 246, 254)
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 20, 28, 47),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 50,
                ),
                onPressed: () => setState(() {
                  List rollOutcome = rollForce(args.verboseMode);
                  int light = rollOutcome[0];
                  int dark = rollOutcome[1];

                  swForceRollLabel = swForceRollLabel.replaceAll('force', ':white_circle:');
                  String header = "${args.nickname} rolled: $swForceRollLabel = ";

                  if (light > 0) {
                    header += "Light($light)";
                  }

                  if (dark > 0) {
                    if (light > 0) {
                      header += " + Dark($dark)";
                    } else {
                      header += "Dark($dark)";
                    }
                  }

                  var payload = json.encode(buildPayload(header, rollOutcome[2]));

                  var url = Uri.parse(args.webhookURL);
                  http.post(url, body: payload, headers: {
                    "Content-Type": "application/json"
                  });


                  nForce = 0;

                  calculateSWForceRollFormula();
                }),
              ),
              Center(
                child: FlatButton(
                    onPressed: () => setState(() {
                      nForce++;
                      calculateSWForceRollFormula();
                    }),
                    child: Column(
                      children: [
                        Image.asset('img/starwars-white.png'),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            forceLabel,
                            style: TextStyle(
                              color: Color.fromARGB(255, 221, 246, 254),
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),

              // Divider
              SizedBox(
                height: 80.0,
              ),

              // VtM Dice
              Text(
                "Vampire the Masquerade 5th Edition",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                child: Container(
                  child: Center(
                    child: Text(
                      vampireRollLabel,
                      style: TextStyle(
                          color: Color.fromARGB(255, 188, 246, 254)
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 20, 28, 47),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 50,
                ),
                onPressed: () => setState(() {
                  List rollOutcome = rollVampire(args.verboseMode);
                  int successes = rollOutcome[0];
                  List fields = rollOutcome[1];
                  vampireRollLabel = vampireRollLabel.replaceAll('normal', ':black_circle:');
                  vampireRollLabel = vampireRollLabel.replaceAll('hunger', ':red_circle:');
                  String header = "${args.nickname} rolled: $vampireRollLabel "
                      "= $successes Successes";

                  var payload = json.encode(buildPayload(header, fields));
                  print(payload);
                  var url = Uri.parse(args.webhookURL);
                  http.post(url, body: payload, headers: {
                    "Content-Type": "application/json"
                  });

                  nNormal = 0;
                  nHunger = 0;

                  calculateVampireRollFormula();
                }),
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () => setState(() {
                        nNormal++;
                        calculateVampireRollFormula();
                      }),
                      child: Column(
                        children: [
                          Image.asset('img/vampire-black.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              normalLabel,
                              style: TextStyle(
                                color: Color.fromARGB(255, 221, 246, 254),
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  FlatButton(
                      onPressed: () => setState(() {
                        nHunger++;
                        calculateVampireRollFormula();
                      }),
                      child: Column(
                        children: [
                          Image.asset('img/vampire-red.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              hungerLabel,
                              style: TextStyle(
                                color: Color.fromARGB(255, 221, 246, 254),
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),

              // Divider
              SizedBox(
                height: 80.0,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        )
    );
  }
}