import 'dart:math';

import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/methods/generic_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class Methods5e {
  static int getModifier (int score) {
    return ((score - 10) / 2).floor();
  }

  static String calculateModifier (int score) {
    int modifier = getModifier(score);

    return formatBonus(modifier);
  }

  static void rollCheck (int bonus, String characterName, String rollContext, ArgSetSheet args) {
    Random rng = new Random();
    int rollResult = 1 + rng.nextInt(20);
    int result = rollResult + bonus;

    String header = bonus >= 0 ? '1d20 + ${bonus.toString()} = ${result.toString()}' : '1d20 - ${bonus.abs().toString()} = ${result.toString()}';
    Fluttertoast.showToast(msg: header);

    header = "$characterName rolled a $rollContext: $header";

    List fields = [{
      "name": "Roll",
      "value": rollResult.toString()
    }];

    GenericMethods.buildAndPushPayload(header, fields, args.webhookURL);
  }

  static void doubleRoll (int bonus, String characterName, String rollContext, ArgSetSheet args) {
    Random rng = new Random();
    int roll1 = 1 + rng.nextInt(20);
    int result1 = roll1 + bonus;

    int roll2 = 1 + rng.nextInt(20);
    int result2 = roll2 + bonus;

    String header = bonus >= 0 ? '1d20 + ${bonus.toString()} = [${result1.toString()} / ${result2.toString()}]' : '1d20 - ${bonus.abs().toString()} = [${result1.toString()} / ${result2.toString()}]';
    Fluttertoast.showToast(msg: header);

    header = "$characterName rolled a $rollContext: $header";

    List fields = [{
      "name": "Rolls",
      "value": [roll1, roll2].toString()
    }];

    GenericMethods.buildAndPushPayload(header, fields, args.webhookURL);
  }

  static int getProficiencyBonus (int characterLevel) {
    return 1 + (characterLevel / 4).ceil();
  }

  static Widget getProficiencyIcon(int proficiency) {
    switch(proficiency) {
      case 0:
        return Icon(
          Icons.radio_button_unchecked_outlined,
          size: 18.0,
          color: Color.fromARGB(255, 188, 246, 254),
        );
        break;

      case 1:
        return Icon(
          Icons.remove_circle_outline,
          size: 18.0,
          color: Color.fromARGB(255, 188, 246, 254),
        );
        break;

      case 2:
        return Icon(
          Icons.check_circle_outline,
          size: 18.0,
          color: Color.fromARGB(255, 188, 246, 254),
        );
        break;

      case 3:
        return Icon(
          Icons.stars_outlined,
          size: 18.0,
          color: Color.fromARGB(255, 188, 246, 254),
        );
        break;

      default:
        return Icon(
          Icons.error_outline,
          size: 18.0,
          color: Color.fromARGB(255, 188, 246, 254),
        );
        break;
    }
  }

  static int calculateProficiency(int baseMod, int proficiency, int characterLevel) {
    int proficiencyBonus = getProficiencyBonus(characterLevel);

    switch (proficiency) {
      case 0:
        return baseMod;
        break;

      case 1:
        return baseMod + (proficiencyBonus / 2).floor();
        break;

      case 2:
        return baseMod + proficiencyBonus;
        break;

      case 3:
        return baseMod + (proficiencyBonus * 2);
        break;

      default:
        return baseMod;
        break;
    }
  }

  static String formatBonus (int bonus) {
    return bonus >= 0 ? '+' + bonus.toString() : bonus.toString();
  }

  static Future<void> updateSavedCharacter(String gameName, Character5e newCharacter) async {
    final box = await Hive.openBox<Character5e>(gameName);

    box.put(0, newCharacter);
  }
}