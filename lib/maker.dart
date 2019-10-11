import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Mark{
  double x, y;
  Mark({this.x, this.y});
  factory Mark.fromJson(Map<String, dynamic> json) {
    return Mark(
      x: json['x'],
      y: json['y']
    );
  }
}

class MarkerProvider with ChangeNotifier{
  List<Mark> _marks = new List<Mark>();
  List<Mark> get marks => _marks;
  add(Mark offset){
    _marks.add(offset);
    notifyListeners();
  }
  MarkerProvider(){
    http.post(url)
  }

}