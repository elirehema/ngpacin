// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueLabel _$ValueLabelFromJson(Map<String, dynamic> json) {
  return ValueLabel(
    label: json['label'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ValueLabelToJson(ValueLabel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };
