import 'package:json_annotation/json_annotation.dart';



part 'value_label.g.dart';
@JsonSerializable()
class ValueLabel{
  final String value;
  final String label;


  ValueLabel({required this.label, required this.value});
  factory ValueLabel.fromJson(Map<String, dynamic> json) => _$ValueLabelFromJson(json);
}