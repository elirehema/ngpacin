import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'balance.g.dart';
abstract class Balance implements Built<Balance, BalanceBuilder> {
  String? get balance;
  String? get msisdn;

  Balance._();
  factory Balance([updates(BalanceBuilder b)]) = _$Balance;

  static Serializer<Balance> get serializer => _$balanceSerializer;
}