import 'package:dicecord_mobile/data_classes/argsets/arg_set_pool.dart';
import 'package:dicecord_mobile/methods/generic_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

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

  // Holding roll
  int _holdingRollValue = 0;

  void setHoldingRoll(int newValue) {
    setState(() {
      _holdingRollValue = newValue;
    });
  }

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
    List<String> blueRolls = [];
    List<String> blackRolls = [];
    List<String> greenRolls = [];
    List<String> purpleRolls = [];
    List<String> yellowRolls = [];
    List<String> redRolls = [];

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

  Widget getDiceSet(ArgSetPool args) {
    if (args.diceType == "Standard Dice") {
      return Column(
        children: [
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
              String header = "$rollLabel = $total";

              if (!Platform.isWindows) {
                Fluttertoast.showToast(msg: header);
              }

              header = "${args.nickname} rolled: $header";

              List fields = [];

              if (args.verboseMode) {
                fields.add({
                  "name": "Rolls",
                  "value": rollResults.toString()
                });
              }

              GenericMethods.buildAndPushPayload(header, fields, args.webhookURL);

              nD4 = 0;
              nD6 = 0;
              nD8 = 0;
              nD10 = 0;
              nD12 = 0;
              nD20 = 0;
              bonus = 0;

              calculateRollFormula();
            }),
            onLongPress: () => setState(() {
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("D4"),
                                content: SizedBox(
                                  height: 88.0,
                                  child: Column(
                                    children: [
                                      Text("How many D4s would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of D4s',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nD4 = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/standard-d4.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'd4' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("D6"),
                                content: SizedBox(
                                  height: 88.0,
                                  child: Column(
                                    children: [
                                      Text("How many D6s would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of D6s',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nD6 = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/standard-d6.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'd6' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("D8"),
                                content: SizedBox(
                                  height: 88.0,
                                  child: Column(
                                    children: [
                                      Text("How many D8s would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of D8s',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nD8 = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/standard-d8.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'd8' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("D10"),
                                content: SizedBox(
                                  height: 88.0,
                                  child: Column(
                                    children: [
                                      Text("How many D10s would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of D10s',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nD10 = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/standard-d10.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'd10' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("D12"),
                                content: SizedBox(
                                  height: 88.0,
                                  child: Column(
                                    children: [
                                      Text("How many D12s would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of D12s',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nD12 = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/standard-d12.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'd12' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("D20"),
                                content: SizedBox(
                                  height: 88.0,
                                  child: Column(
                                    children: [
                                      Text("How many D20s would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of D20s',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nD20 = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/standard-d20.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'd20' : '',
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
        ],
      );
    }
    else if (args.diceType == 'Star Wars FFG / Genesys') {
      return Column(
        children: [
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

              String header = "$swRollLabel = ";

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

              if (!Platform.isWindows) {
                Fluttertoast.showToast(msg: header);
              }

              header = "${args.nickname} rolled: $header";

              header = header.replaceAll('boost', ':blue_circle:');
              header = header.replaceAll('setback', ':black_circle:');
              header = header.replaceAll('ability', ':green_circle:');
              header = header.replaceAll('difficulty', ':purple_circle:');
              header = header.replaceAll('proficiency', ':yellow_circle:');
              header = header.replaceAll('challenge', ':red_circle:');

              GenericMethods.buildAndPushPayload(header, rollOutcome[2], args.webhookURL);

              nBlue = 0;
              nBlack = 0;
              nGreen = 0;
              nPurple = 0;
              nYellow = 0;
              nRed = 0;

              calculateSWRollFormula();
            }),
            onLongPress: () => setState(() {
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("Boost Dice"),
                                content: SizedBox(
                                  height: 107.0,
                                  child: Column(
                                    children: [
                                      Text("How many Boost Dice would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of Boost Dice',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nBlue = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateSWRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/starwars-blue.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'Boost' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("Ability Dice"),
                                content: SizedBox(
                                  height: 107.0,
                                  child: Column(
                                    children: [
                                      Text("How many Ability Dice would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of Ability Dice',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nGreen = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateSWRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/starwars-green.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'Ability' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("Proficiency Dice"),
                                content: SizedBox(
                                  height: 107.0,
                                  child: Column(
                                    children: [
                                      Text("How many Proficiency Dice would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of Proficiency Dice',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nYellow = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateSWRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/starwars-yellow.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'Proficiency' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("Setback Dice"),
                                content: SizedBox(
                                  height: 107.0,
                                  child: Column(
                                    children: [
                                      Text("How many Setback Dice would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of Setback Dice',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nBlack = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateSWRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/starwars-black.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'Setback' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("Difficulty Dice"),
                                content: SizedBox(
                                  height: 107.0,
                                  child: Column(
                                    children: [
                                      Text("How many Difficulty Dice would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of Difficulty Dice',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nPurple = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateSWRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/starwars-purple.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'Difficulty' : '',
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text("Challenge Dice"),
                                content: SizedBox(
                                  height: 107.0,
                                  child: Column(
                                    children: [
                                      Text("How many Challenge Dice would you like to use?"),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Number of Challenge Dice',
                                        ),
                                        onChanged: (newValue) {
                                          setHoldingRoll(int.parse(newValue));
                                        },
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 64, 64, 64),
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          nRed = _holdingRollValue;
                                          _holdingRollValue = 0;
                                        });
                                        calculateSWRollFormula();
                                        Navigator.pop(ctx);
                                      },
                                      child: Text("Use")
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('img/starwars-red.png'),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              args.diceLabels ? 'Challenge' : '',
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

              String header = "$swForceRollLabel = ";

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

              if (!Platform.isWindows) {
                Fluttertoast.showToast(msg: header);
              }

              header = "${args.nickname} rolled: $header";
              header = header.replaceAll('force', ':white_circle:');

              GenericMethods.buildAndPushPayload(header, rollOutcome[2], args.webhookURL);

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
                onLongPress: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: Text("Force Dice"),
                          content: SizedBox(
                            height: 107.0,
                            child: Column(
                              children: [
                                Text("How many Force Dice would you like to use?"),
                                SizedBox(height: 10.0),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Number of Force Dice',
                                  ),
                                  onChanged: (newValue) {
                                    setHoldingRoll(int.parse(newValue));
                                  },
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 64, 64, 64),
                                      fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: Text("Cancel")
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    nForce = _holdingRollValue;
                                    _holdingRollValue = 0;
                                  });
                                  calculateSWForceRollFormula();
                                  Navigator.pop(ctx);
                                },
                                child: Text("Use")
                            )
                          ],
                        );
                      }
                  );
                },
                child: Column(
                  children: [
                    Image.asset('img/starwars-white.png'),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        args.diceLabels ? 'Force' : '',
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
        ],
      );
    }
    else if (args.diceType == 'Vampire the Masquerade 5e') {
      return Column(
        children: [
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

              String header = "$vampireRollLabel = $successes Successes";
              if (!Platform.isWindows) {
                Fluttertoast.showToast(msg: header);
              }

              header = "${args.nickname} rolled: $header";
              header = header.replaceAll('normal', ':black_circle:');
              header = header.replaceAll('hunger', ':red_circle:');

              GenericMethods.buildAndPushPayload(header, fields, args.webhookURL);

              nNormal = 0;
              nHunger = 0;

              calculateVampireRollFormula();
            }),
            onLongPress: () => setState(() {
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
                  onLongPress: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text("Normal Dice"),
                            content: SizedBox(
                              height: 107.0,
                              child: Column(
                                children: [
                                  Text("How many Normal Dice would you like to use?"),
                                  SizedBox(height: 10.0),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Number of Normal Dice',
                                    ),
                                    onChanged: (newValue) {
                                      setHoldingRoll(int.parse(newValue));
                                    },
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 64, 64, 64),
                                        fontSize: 16.0
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("Cancel")
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      nNormal = _holdingRollValue;
                                      _holdingRollValue = 0;
                                    });
                                    calculateVampireRollFormula();
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("Use")
                              )
                            ],
                          );
                        }
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset('img/vampire-black.png'),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          args.diceLabels ? 'Normal' : '',
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
                  onLongPress: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text("Hunger Dice"),
                            content: SizedBox(
                              height: 107.0,
                              child: Column(
                                children: [
                                  Text("How many Hunger Dice would you like to use?"),
                                  SizedBox(height: 10.0),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Number of Hunger Dice',
                                    ),
                                    onChanged: (newValue) {
                                      setHoldingRoll(int.parse(newValue));
                                    },
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 64, 64, 64),
                                        fontSize: 16.0
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("Cancel")
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      nHunger = _holdingRollValue;
                                      _holdingRollValue = 0;
                                    });
                                    calculateVampireRollFormula();
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("Use")
                              )
                            ],
                          );
                        }
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset('img/vampire-red.png'),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          args.diceLabels ? 'Hunger' : '',
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ArgSetPool args = ModalRoute.of(context).settings.arguments as ArgSetPool;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.gameName),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Standard Dice
              SizedBox(
                height: 20.0,
              ),
              getDiceSet(args),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        )
    );
  }
}