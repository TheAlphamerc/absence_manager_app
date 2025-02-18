import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const absencesPath = 'assets/absences.json';
const membersPath = 'assets/members.json';

class Api {
  final bool usedForTesting;
  Api({this.usedForTesting = false});
  Future<List<dynamic>> readJsonFile(String path) async {
    try {
      String content = await rootBundle.loadString(path);
      Map<String, dynamic> data = jsonDecode(content);
      return data['payload'];
    } catch (e) {
      debugPrint('ERROR: $e');
      rethrow;
    }
  }

  Future<List<dynamic>> absences() async {
    return await readJsonFile(
        usedForTesting ? absencesPath : 'packages/api/$absencesPath');
  }

  Future<List<dynamic>> members() async {
    return await readJsonFile(
        usedForTesting ? membersPath : 'packages/api/$membersPath');
  }
}
