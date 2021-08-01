import 'dart:io';
import 'dart:math';

import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/generic_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDice5e extends StatefulWidget {
  const CustomDice5e({Key key}) : super(key: key);

  @override
  _CustomDice5eState createState() => _CustomDice5eState();
}

class _CustomDice5eState extends State<CustomDice5e> {
  // Standard rolls
  String rollLabel = '';
  int nD4 = 0;
  int nD6 = 0;
  int nD8 = 0;
  int nD10 = 0;
  int nD12 = 0;
  int nD20 = 0;
  int bonus = 0;

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

  // Holding roll
  int _holdingRollValue = 0;

  void setHoldingRoll(int newValue) {
    setState(() {
      _holdingRollValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ArgSetSheet args = ModalRoute.of(context).settings.arguments as ArgSetSheet;

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
              Column(
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

                      header = "${args.character.characterName} rolled a custom roll: $header";

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
                                      'd4',
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
                                      'd6',
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
                                      'd8',
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
                                      'd10',
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
                                      'd12',
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
                                      'd20',
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
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        )
    );
  }
}
