import 'package:json_annotation/json_annotation.dart';

part 'mark.g.dart';

@JsonSerializable()
class Mark{
  double x, y;
  Mark({this.x, this.y});
  factory Mark.fromJson(Map<String, dynamic> json) => _$MarkFromJson(json);
  Map<String, dynamic> toJson() => _$MarkToJson(this);
}

