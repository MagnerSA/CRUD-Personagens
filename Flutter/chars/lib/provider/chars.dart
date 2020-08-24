import 'dart:math';

import 'package:chars/data/dummy_chars.dart';
import 'package:chars/models/char.dart';
import 'package:flutter/material.dart';

class Chars with ChangeNotifier {
  Map<String, Char> _items = {...DUMMY_CHARS};

  List<Char> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Char byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Char char) {
    if (char == null) {
      return;
    }

    // alterar
    if (char.id != null &&
        char.id.trim().isNotEmpty &&
        _items.containsKey(char.id)) {
      _items.update(
          char.id,
          (_) => Char(
                id: char.id,
                name: char.name,
                birth: char.birth,
                imageUrl: char.imageUrl,
              ));
    } else {
      // adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Char(
          id: id,
          name: char.name,
          birth: char.birth,
          imageUrl: char.imageUrl,
        ),
      );
    }

    // adicionar

    notifyListeners();
  }

  void remove(Char char) {
    if (char != null && char.id != null) {
      _items.remove(char.id);
      notifyListeners();
    }
  }
}
