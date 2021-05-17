import 'dart:convert';

import 'package:http/http.dart' as http;

class GenericMethods {
  static Map buildPayload(String payloadHeader, List fields) {
    return {
      "username": "Dicecord",
      "avatar_url": "https://github.com/corndog-foundry/dicecord-flutter/blob/main/img/icon.png?raw=true",
      "embeds": [
        {
          "title": payloadHeader,
          "fields": fields
        }
      ]
    };
  }

  static void pushPayload(String payload, String targetURL) {
    var url = Uri.parse(targetURL);
    http.post(url, body: payload, headers: {
      "Content-Type": "application/json"
    });
  }

  static void buildAndPushPayload(String payloadHeader, List fields, String targetURL) {
    pushPayload(json.encode(buildPayload(payloadHeader, fields)), targetURL);
  }
}