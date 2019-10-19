import 'dart:convert';

import 'package:http/http.dart' as http;
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
    var response = await http.get(
        "https://raw.githubusercontent.com/adersh-zmt/image_mark/master/data/marks.json");
    if (response.statusCode == 200) {
      var markArray = jsonDecode(response.body) as List;
      _marks = markArray.map((json) => Mark.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
