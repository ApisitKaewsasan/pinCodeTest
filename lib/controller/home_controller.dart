import 'dart:async';

import 'package:flutter/material.dart';

class HomeController {
  StreamController<String> messageText = StreamController<String>();

  // case input must be greater than or equal to 6 characters.
  bool testCase1(String text) {
    if (text.length < 4) {
      return true;
    }
    return false;
  }

  // case input must prevent more than 2 duplicate numbers in a row
  // case input must prevent more than 2 sets of repeating numbers.
  bool testCase2AndTestCase4(String text) {
    int duplicatePoint = 0;
    final data = text.characters.toList();
    for (int i = 0; i < data.length; i++) {
      if (i != 0 && data[i] == data[i - 1]) {
        if (duplicatePoint == 0) {
          duplicatePoint = duplicatePoint + 2;
        } else {
          if (duplicatePoint < 2) {
            duplicatePoint++;
          } else {
            duplicatePoint = 0;
          }
        }
      }
    }
    return duplicatePoint == 2 ? true : false;
  }

  // case The input must prevent more than 2 consecutive numbers.
  bool testCase3(String text) {
    int duplicatePoint = 0;
    final data = text.characters.toList();
    for (int i = 0; i < data.length; i++) {
      if (i != 0 && int.parse(data[i]) - 1 == int.parse(data[i - 1])) {
        duplicatePoint++;
      }
    }
    return duplicatePoint > 1 ? true : false;
  }
}
