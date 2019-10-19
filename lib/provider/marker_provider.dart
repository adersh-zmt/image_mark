import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'mark.dart';

class MarkerProvider with ChangeNotifier {
  List<Mark> _marks = new List<Mark>();
  List<Mark> get marks => _marks;
  add(Mark offset) {
    _marks.add(offset);
    notifyListeners();
  }

  MarkerProvider() {
    getMarkers();
  }
  getMarkers() async {
    var sample = await rootBundle.loadString('data/marks.json');
    var markArray = jsonDecode(sample) as List;
   markArray.forEach((json) {
     add(Mark.fromJson(json));
   });
    notifyListeners();
  }
}

